#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Custom Libraries
#include "app_config.h"
#include "appManager.h"
#include "connectionManager.h"
#include "EnergyMonitoring.h"
#include "receiverBoard.h"

connectionManager conManagerr;

/* constructor implementation */

void appManager_ctor(appManager * const me, int sw_val) {
  initBoard();
  me->conManager = connectionManager_ctor(&conManagerr);
  me->switch_val = sw_val;
  broadcast_appMgr(me);
}

/* Function Implementation */


// Setting the Tank LEDs accordingly
void LED_allOff() {
   digitalWrite(LED1_U,HIGH);
   digitalWrite(LED1_D,HIGH);
   digitalWrite(LED2_U,HIGH);
   digitalWrite(LED2_D,HIGH);
   digitalWrite(LED3_U,HIGH);
   digitalWrite(LED3_D,HIGH);
   digitalWrite(LED4_U,HIGH);
   digitalWrite(LED4_D,HIGH);
   digitalWrite(LED5_U,HIGH);
   digitalWrite(LED5_D,HIGH);
}

void LED_allOn() {
   digitalWrite(LED1_U,LOW);
   digitalWrite(LED1_D,LOW);
   digitalWrite(LED2_U,LOW);
   digitalWrite(LED2_D,LOW);
   digitalWrite(LED3_U,LOW);
   digitalWrite(LED3_D,LOW);
   digitalWrite(LED4_U,LOW);
   digitalWrite(LED4_D,LOW);
   digitalWrite(LED5_U,LOW);
   digitalWrite(LED5_D,LOW);
}

void initRGB(){
  pinMode(HEARTBEAT_LED, OUTPUT);
  pinMode(WIFI_LED, OUTPUT);
  pinMode(BLE_LED, OUTPUT);
  
  digitalWrite(HEARTBEAT_LED,HIGH);
  digitalWrite(WIFI_LED,HIGH);
  digitalWrite(BLE_LED,HIGH);

  Serial.println("InitRGB : appManager.cpp");
 }

 void initBoard() {
  
  // Configuring Board pins
  initRGB();
  pinMode(SW_pin, OUTPUT);
  pinMode(touch1, INPUT);
  pinMode(WT_sensor, INPUT);
  pinMode(A0,INPUT);
  pinMode(ACS_pin,INPUT);

  // setting Tank level LEDs
  pinMode(LED1_U,OUTPUT);
  pinMode(LED1_D,OUTPUT);
  pinMode(LED2_U,OUTPUT);
  pinMode(LED2_D,OUTPUT);
  pinMode(LED3_U,OUTPUT);
  pinMode(LED3_D,OUTPUT);
  pinMode(LED4_U,OUTPUT);
  pinMode(LED4_D,OUTPUT);
  pinMode(LED5_U,OUTPUT);
  pinMode(LED5_D,OUTPUT);

 }
 
 void broadcast_appMgr(appManager * appMgr) {
  
   char data[] = {"{"};  // for JSON
   char s1[] = "\"Board\" : ";
   char * msg = strcat(data,s1);
   char buffer[100];
   char *num;

   if (asprintf(&num, "%d", getBoard_ID) == -1) {
        perror("asprintf");
    } else {
  //      printf(strcat(s1,num));
  //      free(num);
    }

  // char s2[] = appMgr->energy;
  //char buff[20];
   //int totalEnergy;
/*
   // formatting JSON to publish
   data = "{\"Board\" : ";
   data += "\""+getBoard_ID();
   data += "\",";

   data += "\"Switch Value\" : ";
   data += "\" "+appMgr->switch_val;
   data += "\",";

   data += "\"Water Level\" : ";
   data += "\" "+appMgr->waterLevel;
   data += "\"}";
  
   // for setting float value to sting JSON
   /* 
   data += "\"Total Energy\" : ";
   gcvt(totalEnergy, 6, buff);
   data += "\""+buff;
   data += "\"}";
   */
   //printf(strcat(msg,num));
   Serial.println(msg); 
  
 }

 void check_WT(appManager * appMgr) {

  uint32_t raw; 
  uint32_t Vin = 3.3;
  float Vout = 0.0;
  float buffer = 0;
  raw = analogRead(WT_sensor);
//  if(raw){
  buffer = raw * Vin;
  Vout = (buffer)/1024.0;
  // Serial.print("Raw: ");
  // Serial.print(raw);
  // Serial.print("\t");
  // Serial.print("Vout: ");
  // Serial.print(Vout);
  String volt_level = "Tank_Level";
  volt_level += Vout;
  // Serial.print("\t");
  // Serial.println(volt_level);
  publishData(volt_level,appMgr->conManager);
  //broadcast_appMgr(appMgr);
 }


 int checkTouchDetected(appManager* appMgr) {
  if(digitalRead(touch1) == HIGH){
        long press_start = millis();
        long press_end = press_start;
        int count_press = 0;

        while (digitalRead(touch1) == HIGH) {
          press_end = millis();
          count_press = press_end-press_start;
           if((count_press>3000) && (WIFI_AVAILABILITY)) {
            resetWifi(appMgr->conManager); // reset settings - wipe stored credentials for testing, these are stored by the esp library
            connectWiFi(appMgr->conManager);
            break;
           }  
        } 
        
        
        //publishData("pressed", appMgr->conManager);   //,radioAvailability,MQTT_AVAILABILITY);
        //broadcast_appMgr(appMgr);
        Serial.print("pressed for ");
        Serial.println(count_press);

        if(count_press<2500) {
          check_WT(appMgr);
          if (appMgr->switch_val == 0){
            digitalWrite(SW_pin, 1);
            Serial.println("Motor Off");
            appMgr->switch_val= 1;
            LED_allOff();
          } else {
            digitalWrite(SW_pin, 0);
            Serial.println("Motor On");
            appMgr->switch_val = 0;
            LED_allOn();
          }
          delay(100);             
        }
  }
  return appMgr->switch_val;
 }

 void eMonitorig(appManager* appMgr) {
    
   do{    // when switch is ON
      unsigned long prev_pub_time = 0 ;

        if((unsigned long)(millis() - prev_pub_time) >= PUBLISH_INTERVAL) { 
              prev_pub_time = millis();
              //broadCast(appMgr);
           /*   
              Serial.print(" Energy Consumed in ");
              Serial.print(PUBLISH_INTERVAL);
              printf(" = %0.2f Joules\n",getEngergy());  
              Serial.print("Total Energy reset : ");
              Serial.println(getEngergy());            
           */   
          }
    
    }while((appMgr->switch_val==1));
 }

 
