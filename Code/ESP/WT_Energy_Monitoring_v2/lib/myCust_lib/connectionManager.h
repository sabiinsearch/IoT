#ifndef __CONNNECTION_MANAGER_H__
#define __CONNNECTION_MANAGER_H__

#include "Arduino.h"

/*Connection Manager's attributes*/


typedef struct {
  
  bool radio_status;  
  bool ble_status;
  bool Wifi_status;
  bool mqtt_status;  

} connectionManager;

/*Connection Manager's operations*/
 
   connectionManager * const  connectionManager_ctor(connectionManager * const me);     // Constructor

   void print_communication(); 
   void initWiFi();
   bool connectMQTT(connectionManager*);
   void connectWiFi(connectionManager*);
   void reconnectWiFi(connectionManager*);
   void resetWifi(connectionManager*);
   void initRadio(connectionManager*);
   void checkDataOnRadio();
   void mqttCallback(char*, byte*, unsigned int);
   void publishData(String, connectionManager*);
   void publishOnRadio(String,connectionManager*);
   void publishOnMqtt(String, connectionManager*);
   char* string2char(String);

#endif