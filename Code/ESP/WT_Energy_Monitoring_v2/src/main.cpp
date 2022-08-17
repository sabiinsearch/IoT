// Default Arduino includes
#include <Arduino.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <Preferences.h>

// to import all my custom libraries

#include "app_config.h"
#include "receiverBoard.h"
#include "connectionManager.h"
#include "appManager.h"
#include "EnergyMonitoring.h"
                  

// my Managers
appManager managr;


// setup function
void setup() {

  Serial.begin(9800);
  while (!Serial);
  delay(1000);
	
  // Send some device info
	// Serial.println("Build: ");
  
  // Serial.print("Board ID: WT-");
  // Serial.println(getBoard_ID());

  LED_allOff();
  //digitalWrite(touch1, 0);

  // Initial setting of Switch
  digitalWrite(SW_pin, 1);

  // Initiating Manager
  Serial.println("Initializing App Manager..");
  appManager_ctor(&managr,0);


  // Run Energy Monitoring in Core 2
//  xTaskCreatePinnedToCore(energy_consumption, "Task2", 10000, NULL, 1, NULL,  1);
    xTaskCreatePinnedToCore(energy_consumption, "Task2", 10000, &managr, 1, NULL,  1);
    Serial.println("Energy Monitor set..");

    setWaterLevel_indicators(&managr);     // Set Water Tank Level
    Serial.println("Water_Level indicators set...");

}
/**
 * Logic that runs in Loop
 */
void loop() { 
    managr.switch_val = checkTouchDetected(&managr);

    if(RADIO_AVAILABILITY) {
      checkDataOnRadio();
    }

    if (managr.conManager->Wifi_status && MQTT_AVAILABILITY && (!!!mqttCallback )) {
       Serial.println("MQTT Connection Lost, RECONNECTING AGAIN.......");
       managr.conManager->mqtt_status = false;
       managr.conManager->mqtt_status = connectMQTT(managr.conManager); 
    }
   setWaterLevel_indicators(&managr);
}
