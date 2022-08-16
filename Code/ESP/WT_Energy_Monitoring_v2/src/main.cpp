// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <Preferences.h>

#include "app_config.h"
#include "connectionManager.h"
#include "appManager.h"
#include "myCommon.h"                    // to import all my custom libraries

// my Managers
appManager managr;

unsigned long printPeriod = 1000; // in milliseconds
// Track time in milliseconds since last reading
unsigned long previousMillis = 0;

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

  LED_allOff();
  //digitalWrite(touch1, 0);

  // Initial setting of Switch
  digitalWrite(SW_pin, 1);

  // Initiating Manager
  appManager_ctor(&managr,0);


  // Run Energy Monitoring in Core 2
  //xTaskCreatePinnedToCore(energy_consumption, "Task2", 10000, NULL, 1, NULL,  1);


}
/**
 * Logic that runs in Loop
 */
void loop() { 
  /*
    switch_val = checkTouchDetected(managr.conManager, switch_val);

    if(RADIO_AVAILABILITY) {
      checkDataOnRadio();
    }

    if (managr.conManager.Wifi_status && MQTT_AVAILABILITY && (!!!mqttCallback )) {
       Serial.println("MQTT Connection Lost, RECONNECTING AGAIN.......");
       mqttConnected = false;
       mqttConnected = connectMQTT(managr.conManager);
    }

    
          if((unsigned long)(millis() - prev_pub_time) >= publish_time) { 
              prev_pub_time = millis();
              Serial.print(" Energy Consumed in ");
              Serial.print(PUBLISH_INTERVAL);
              printf(" = %0.2f Joules\n",getEngergy());  
              Serial.print("Total Energy reset : ");
              Serial.println(getEngergy());            
          }
          
  */
}
