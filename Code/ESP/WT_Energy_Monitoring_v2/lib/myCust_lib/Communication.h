#ifndef __COMMUNICATION_H__
#define __COMMUNICATION_H__

#include <Arduino.h>

   void print_communication(); 
   void initWiFi();
   void connectWiFi();
   void reset_wifi();

   bool initRadio(bool);
   void checkDataOnRadio();
   // void publishData(String,bool,bool);
   void publishData(String);
   void publishOnRadio(String,bool);
   void publishOnMqtt(String,bool);
   char* string2char(String);


  
#endif