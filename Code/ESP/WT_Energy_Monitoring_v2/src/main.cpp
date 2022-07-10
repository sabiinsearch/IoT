// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <PubSubClient.h>

#include "myCommon.h"

// for Energy Monitoring
#include <ACS712.h>
#include <Filters.h>
#include <stdio.h>

ACS712 sensor(ACS712_20A, 34);
char watt[5];
unsigned long last_time =0;
unsigned long current_time =0;
float Wh =0 ;
String Energy;

// Another reference
float testFrequency = 55;                     // test signal frequency (Hz)
float windowLength = 10.0/testFrequency;     // how long to average the signal, for statistist
int sensorValue = 0;
double intercept = 0.00009999199919; // to be adjusted based on calibration testing
float slope = 0.0316599997; // to be adjusted based on calibration testing
float current_amps; // estimated actual current in amps

unsigned long printPeriod = 1000; // in milliseconds
// Track time in milliseconds since last reading
unsigned long previousMillis = 0;

#include <Preferences.h>

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

// varialble for Energy Monitoring
static float total_energy_consumed;
bool hbLedState = LOW; // Heartbeat LED state


int sw2Val = 1;

boolean lastState2 = LOW;
bool usePrimAP = true; // use primary or secondary WiFi network



// Energy Consumption
void ernergy_consumption(void * pvParameters) {

    RunningStatistics inputStats;                 // create statistics to look at the raw test signal
    inputStats.setWindowSecs( windowLength );
    
    while( true ) {
  //    float I = sensor.getCurrentAC(50);

      Energy = "Current: ";
      sensorValue = analogRead(ACS_pin);  // read the analog in value:
      inputStats.input(sensorValue);  // log to Stats function      
      
      
      if((unsigned long)(millis() - previousMillis) >= printPeriod) {
        previousMillis = millis();   // update time      
        current_amps = intercept + slope * inputStats.sigma();
        // Energy += ( (current_amps*230) *0.95);
        // Serial.print(Energy);
        // Serial.print("\t");
        //Serial.print("Current: ");
        printf("Current = %.3f\n",current_amps);
       // Serial.println(roundf(current_amps*1000)/1000);
//        publishData(Energy);
 //       publishData((Energy+current_amps));
 //  //     printf("%.3lf",current_amps);
      }
     }

/*   float value = analogRead(ACS_pin);
     total_energy_consumed += value;
     Serial.print("Energy = ");
     Serial.println(total_energy_consumed);
*/

/*
   float V = 230;
   float I = sensor.getCurrentAC();
  // Serial.print("Current: ");
  // Serial.print(I);
   float P = V * I;
   last_time = current_time;
   current_time = millis();
   Wh = Wh+  P *(( current_time -last_time) /3600000.0) ;
    dtostrf(Wh, 4, 2, watt);
    Energy = "Energy: ";
    Energy += watt;
    publishData(Energy);
   Serial.print("  Energy: ");
   Serial.print(watt);
   Serial.println();
   delay(500);
*/
}

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
