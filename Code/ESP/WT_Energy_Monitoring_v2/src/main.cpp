// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <Preferences.h>
#include "myCommon.h"                    // to import all my custom libraries

// Variable to hold switch value
int switch_val;

/** Connection status */
volatile bool wifiConnected = false;
volatile bool mqttConnected = false;

/** Connection change status */
bool connStatusChanged = false;

// Set flags for Communication and getting values from app_config.h
     bool enableRadio = RADIO_AVAILABILITY;    
     bool enableBLE = BLE_AVAILIBILITY;
     bool enableWiFi = WIFI_AVAILABILITY;
     bool enableMQTT = MQTT_AVAILABILITY;


// setup function
void setup() {

  Serial.begin(9800);
  while (!Serial);
  delay(1000);
	
  // Send some device info
	Serial.println("Build: ");
  
  Serial.print("Board ID: WT-");
  getBoard_ID();
  
  // Initiate Switch
  switch_val = switch_value;    
  
  // Configuring Board pins
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

  // Initial setting of Switch
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

  // Run Energy Monitoring in Core 2
  xTaskCreatePinnedToCore(energy_consumption, "Task2", 10000, NULL, 1, NULL,  1);

}
/**
 * Logic that runs in Loop
 */
void loop() {
    switch_val = checkTouchDetected(enableRadio,enableWiFi, switch_val);
    checkDataOnRadio();
}
