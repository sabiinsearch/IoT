#ifndef __APP_MANAGER_H__
#define __APP_MANAGER_H__

#include "app_config.h"
#include "connectionManager.h"

/*Application Manager's attributes*/

typedef struct {

     connectionManager* conManager;
//   energyMonitoringManager eManager;
     float energy;
     int switch_val;
     uint32_t waterLevel; 

} appManager;

void appManager_ctor(appManager * const me, int sw_val); // constructor

void initBoard();   
void LED_allOn();
void LED_allOff();
void broadcast_appMgr(appManager*);
void check_WT(appManager*);
int  checkTouchDetected(appManager*);
void setWaterLevel_indicators(appManager*);

// functions to set LEDs as per status

/*

HEARTBEAT_LED             // Red
WIFI_LED                  // Blue
BLE_LED                   // Green
*/

#endif