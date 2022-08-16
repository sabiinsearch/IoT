#ifndef __APP_MANAGER_H__
#define __APP_MANAGER_H__

#include "app_config.h"
#include "connectionManager.h"

/*Application Manager's attributes*/

typedef struct {

     connectionManager* conManager;
//   energyMonitoringManager eManager;
     int switch_val; 

} appManager;

void appManager_ctor(appManager * const me, int sw_val); // constructor

void initBoard();   
void initRGB();
void LED_allOn();
void LED_allOff();

void check_WT(bool,bool, appManager*);
int  checkTouchDetected(connectionManager* con, int);

#endif