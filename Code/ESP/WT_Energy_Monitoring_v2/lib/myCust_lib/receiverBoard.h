#include <Arduino.h>

#ifndef __RECEIVERBOARD_H__
#define __RECEIVERBOARD_H__

// #define RGB LEDs
#define HEARTBEAT_LED  5
#define WIFI_LED  17
#define BLE_LED  16

// # define Level LEDs
#define LED1_U   32
#define LED1_D   33
#define LED2_U   25
#define LED2_D   26
#define LED3_U   27 
#define LED3_D   14 
#define LED4_U   12 
#define LED4_D   13 
#define LED5_U   2 
#define LED5_D   18 

#define SW_pin    19
#define ACS_pin   34      // Energy Sensor
#define touch1    4       // Pin for capactitive touch sensor
#define WT_sensor 15      // pin from water sensor

   void initRGB();
   void LED_allOn();
   void LED_allOff();

#endif