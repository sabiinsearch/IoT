#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ArduinoJson.h>

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
  Serial.println("Board Initialized..");
  me->conManager = connectionManager_ctor(&conManagerr);
  Serial.println("Connection Manager set with App Manager");
  me->switch_val = sw_val;
  //broadcast_appMgr(me);
  Serial.println("AppManager set..");
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
  pinMode(MQTT_LED, OUTPUT);
  
  digitalWrite(HEARTBEAT_LED,HIGH);
  digitalWrite(WIFI_LED,HIGH);
  digitalWrite(MQTT_LED,HIGH);

  //Serial.println("InitRGB : appManager.cpp");
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
 
 void updateConfig(appManager*) {
   
 }

 void broadcast_appMgr(appManager * appMgr) {
  
  String payload;
  StaticJsonBuffer<200> dataJsonBuffer;
  JsonObject& jsonOut = dataJsonBuffer.createObject();

  //char* boardID = getBoard_ID();
  
  jsonOut["type"] = BOARD_TYPE;
  jsonOut["uniqueId"] = getBoard_ID();
  jsonOut["Switch Value"] = appMgr->switch_val;
  jsonOut["Water Level"] = appMgr->waterLevel;
  if (appMgr->switch_val==1) {
     jsonOut["Energy"] = appMgr->energy;
  }
  // Convert JSON object into a string
  jsonOut.printTo(payload);
   Serial.print(payload);
   Serial.println("\n"); 
  dataJsonBuffer.clear();
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
  //publishData(volt_level,appMgr->conManager);
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
            Serial.println("Wifi Resetting.."); 
            digitalWrite(WIFI_LED,HIGH);
            digitalWrite(HEARTBEAT_LED,LOW);
            resetWifi(appMgr->conManager); // reset settings - wipe stored credentials for testing, these are stored by the esp library
            connectWiFi(appMgr->conManager);
            break;
           }  
        } 
        

        if(count_press<2500) {
          check_WT(appMgr);
          if (appMgr->switch_val == 1){
            Serial.println("Energy Monitoring Off..");
            digitalWrite(SW_pin, 1);
            LED_allOff();
            appMgr->switch_val= 0;
          } else {
            Serial.println("Energy Monitoring On..");
            digitalWrite(SW_pin, 0);
            LED_allOn();
            appMgr->switch_val = 1;
          }
          delay(100);             
        } 
        broadcast_appMgr(appMgr);
  }
  return appMgr->switch_val;
 }



 
