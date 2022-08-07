
#ifndef __APP_CONFIG_H__
#define __APP_CONFIG_H__

#include "Arduino.h"
   
// Set flags for Communication
     #define RADIO_AVAILABILITY  false
     #define BLE_AVAILIBILITY    true
     #define WIFI_AVAILABILITY   false
     #define MQTT_AVAILABILITY   false


// Energy Monitoring configrations
    #define PUBLISH_INTERVAL    60000L    // time in Minutes * sec in a min * milliseconds in sec
    #define VOLTAGE_IN          240       // Input Voltage


//  Mqtt Configurations

    // IOT PLATFORM VARIABLES
    
    #define ORG             "rqeofj"
    #define BOARD_TYPE      "SB_MICRO"
    #define TOKEN           "1SatnamW"
    #define PUBSUB_PREFIX   "iot-2/type/SB_MICRO/id/"

    /** Unique device name */
    char apName[] = "SB_MICRO-xxxxxxxxxxxx";

    char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
    // char server[] = "mqtt.flespi.io";
    // iot-2/type/device_type/id/device_id/evt/event_id/fmt/json
    String pub_topic = "iot-2/evt/cloud/fmt/json";
    String sub_topic = "iot-2/cmd/device/fmt/json";
    // String pub_topic = "evt/sb_micro/cloud/";
    // String sub_topic = "evt/sb_micro/board/";
    char mqttUser[] = "use-token-auth";
    char mqttPassword[] = "1SatnamW"; // Auth token of Device registered on Watson IoT Platform
    // char mqttUser[] = "IdawJwQIHs0LuzfZKYWvXFwUeV0bbiAJlA3TUJpp0fYkE39cPTyAmUkqD9pFfPcp";
    // char mqttPassword[] = "";

#endif