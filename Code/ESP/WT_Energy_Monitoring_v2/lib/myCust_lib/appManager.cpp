#include "appManager.h"
#include "connectionManager.h"

#include "myCommon.h"
#include "receiverBoard.h"

// Variables
int SwitchValue;   

// variables for Water Tank
int raw;
int Vin = 3.3;
float Vout = 0.0;
float buffer = 0;
int level;
bool hbLedState = LOW; // Heartbeat LED state
unsigned long interval = 5; // the time we need to wait
//unsigned long previousMillis = 0;
unsigned long previousTouchMillis = 0;


connectionManager conManagerr;

/* constructor implementation */

void appManager_ctor(appManager * const me, connectionManager conManager) {
  me->conManager = conManagerr;
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
   getMyMsg();
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
   getMyMsg();
}

void initRGB(){
  Serial.println("InitRGB");
  digitalWrite(HEARTBEAT_LED,HIGH);
  digitalWrite(WIFI_LED,HIGH);
  digitalWrite(BLE_LED,HIGH);
  delay(1000);
  digitalWrite(HEARTBEAT_LED,LOW);
  digitalWrite(WIFI_LED,LOW);
  digitalWrite(BLE_LED,LOW);
 }

 void check_WT(bool radio_status,bool Mqtt_status) {
  raw = analogRead(WT_sensor);
//  if(raw){
  buffer = raw * Vin;
  Vout = (buffer)/1024.0;
  Serial.print("Raw: ");
  Serial.print(raw);
  Serial.print("\t");
  Serial.print("Vout: ");
  Serial.print(Vout);
  String volt_level = "Tank_Level";
  volt_level += Vout;
  Serial.print("\t");
  Serial.println(volt_level);
  publishData(volt_level,conManagerr);
 }


 int checkTouchDetected(connectionManager * const con, int switch_value) {
  if(digitalRead(touch1) == HIGH){
        long press_start = millis();
        long press_end = press_start;
        int count_press = 0;

        while (digitalRead(touch1) == HIGH) {
          press_end = millis();
          count_press = press_end-press_start;
           if((count_press>3000) && (WIFI_AVAILABILITY)) {
            resetWifi(conManagerr); // reset settings - wipe stored credentials for testing, these are stored by the esp library
            connectWiFi(conManagerr);
            break;
           }  
        } 
        
        
        publishData("pressed", conManagerr);   //,radioAvailability,MQTT_AVAILABILITY);
        Serial.print("pressed for ");
        Serial.println(count_press);

        if(count_press<2500) {
          check_WT(RADIO_AVAILABILITY,MQTT_AVAILABILITY);
          if (switch_value == 0){
            digitalWrite(SW_pin, 1);
            Serial.println("Motor Off");
            SwitchValue = 1;
            LED_allOff();
          } else {
            digitalWrite(SW_pin, 0);
            Serial.println("Motor On");
            SwitchValue = 0;
            LED_allOn();
          }
          delay(100);             
        }
  }
  return SwitchValue;
 }
