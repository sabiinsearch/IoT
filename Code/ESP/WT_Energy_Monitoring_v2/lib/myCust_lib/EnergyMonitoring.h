
#ifndef __ENERGYMONITORING_H__
    #define __ENERGYMONITORING_H__

    #include "Arduino.h"
    #include "appManager.h"
        
        void eMonitorig(appManager*);
        void  energy_consumption(void * pvParameters);
        void  resetEnergy(appManager*);
        unsigned long getEngergy(appManager*);
        

#endif