// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <PubSubClient.h>
#include <Preferences.h>

#include "myCommon.h"



// //static int taskCore = 0;
bool radioAvailable = false;
bool enableRadio = false;
bool enableBLE = true;
bool enableWiFi = false;
bool enableMQTT = false;

unsigned long interval = 5; // the time we need to wait
//unsigned long previousMillis = 0;
unsigned long previousTouchMillis = 0;

// variables for Water Tank
int raw;
int Vin = 3.3;
float Vout = 0.0;
float buffer = 0;
int level;

bool hbLedState = LOW; // Heartbeat LED state


int sw2Val = 1;

boolean lastState2 = LOW;
bool usePrimAP = true; // use primary or secondary WiFi network


// setup

void setup() {

  Serial.begin(9800);
  while (!Serial);
  delay(1000);
	// Send some device info
	Serial.print("Build: ");

  pinMode(HEARTBEAT_LED, OUTPUT);
  pinMode(WIFI_LED, OUTPUT);
  pinMode(BLE_LED, OUTPUT);
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

  LED_allOff();
  //digitalWrite(touch1, 0);
  digitalWrite(SW_pin, 1);

  // Init RGB
  initRGB();
  
  // Init WiFi
  if(enableWiFi) {
       initWiFi();
       connectWiFi();
  }
  // Init Lora
  if(enableRadio){
      initRadio(enableRadio);
      Serial.print(" Ready to print ");
  }
  // Define Energy Monitoring in Core 2
  xTaskCreatePinnedToCore(ernergy_consumption, "Task2", 10000, NULL, 1, NULL,  1);

}


 void check_WT() {
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
  publishData(volt_level, radioAvailable);
 }

 void checkTouchDetected(){
  if(digitalRead(touch1) == HIGH){
        long press_start = millis();
        long press_end = press_start;
        int count_press = 0;

        while (digitalRead(touch1) == HIGH) {
          press_end = millis();
          count_press = press_end-press_start;
           if(count_press>3000) {
            reset_wifi(); // reset settings - wipe stored credentials for testing, these are stored by the esp library
            connectWiFi();
            break;
           }  
        } 
        
        
        publishData("pressed",true);
        Serial.print("pressed for ");
        Serial.println(count_press);

        if(count_press<2500) {
          check_WT();
          if (sw2Val == 0){
            digitalWrite(SW_pin, 1);
            Serial.println("Motor Off");
            sw2Val = 1;
            LED_allOff();
          } else {
            digitalWrite(SW_pin, 0);
            Serial.println("Motor On");
            sw2Val = 0;
            LED_allOn();
          }
          delay(100);             
        }
  }
 }

/**
 * Logic that runs in Loop
 */
void loop() {
    checkDataOnRadio();
    checkTouchDetected();
   // checkLevel();
    //ernergy_consumption();
    //while(1) {
    //  check_WT();
    //  delay(1000);
    //}
}
