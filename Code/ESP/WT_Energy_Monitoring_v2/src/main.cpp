// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <Preferences.h>
#include "myCommon.h"                    // to import all my custom libraries

#include "connectionManager.h"

// Variable to hold switch value
int switch_val;

/** Connection status */
connectionManager conManagerr;

volatile bool wifiConnected = false;
volatile bool mqttConnected = false;

/** Connection change status */
bool connStatusChanged = false;

// Set flags for Communication and getting values from app_config.h
     bool enableRadio = RADIO_AVAILABILITY;    
     bool enableBLE = BLE_AVAILIBILITY;
     bool enableWiFi = WIFI_AVAILABILITY;
     bool enableMQTT = MQTT_AVAILABILITY;

unsigned long printPeriod = 1000; // in milliseconds
// Track time in milliseconds since last reading
unsigned long previousMillis = 0;

unsigned long publish_time = PUBLISH_INTERVAL;     // from app_config.h
unsigned long prev_pub_time = 0 ;


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
  switch_val = 0;    
  
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
  

  // Run Energy Monitoring in Core 2
  xTaskCreatePinnedToCore(energy_consumption, "Task2", 10000, NULL, 1, NULL,  1);


}
/**
 * Logic that runs in Loop
 */
void loop() {
    switch_val = checkTouchDetected(enableRadio,enableWiFi, switch_val);

    if(enableRadio) {
      checkDataOnRadio();
    }

    if (wifiConnected && enableMQTT && (!!!mqttCallback )) {
       Serial.println("MQTT Connection Lost, RECONNECTING AGAIN.......");
       mqttConnected = false;
       mqttConnected = connectMQTT(wifiConnected,mqttConnected);
    }

    
          if((unsigned long)(millis() - prev_pub_time) >= publish_time) { 
              prev_pub_time = millis();
              printf("Total Energy consumed in last 5 min = %0.2f Joules\n",getEngergy());  
              Serial.print("Total Energy reset : ");
              Serial.println(getEngergy());            
          }
          

}
