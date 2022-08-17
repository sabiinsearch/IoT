#include "EnergyMonitoring.h"
#include "Arduino.h"

#include "app_config.h"
#include "appManager.h"
#include "receiverBoard.h"      // for using cust_board pins

// for Energy Monitoring

#include <Filters.h>
#include <stdio.h>


// varialble for Energy Monitoring
volatile unsigned long total_energy_consumed;

  unsigned long getEngergy(appManager* appMgr) {
    
    resetEnergy(appMgr);
    return appMgr->energy;
}
// Energy Consumption

 void eMonitorig(appManager* appMgr) {
       // when switch is ON
        broadcast_appMgr(appMgr);
        resetEnergy(appMgr);   
 }

 void energy_consumption(void * pvParameters) { 
    
    appManager* appMgr = (appManager*)pvParameters; 
    RunningStatistics inputStats;                 // create statistics to look at the raw test signal
    float Volt_In = VOLTAGE_IN;
    // Another reference
    float testFrequency = 40;                     // test signal frequency (Hz)
    float windowLength = 90.0/testFrequency;     // how long to average the signal, for statistist
    int sensorValue = 0;
    double intercept = -0.0529009; // to be adjusted based on calibration testing
    float slope = 0.0975599997; // to be adjusted based on calibration testing
    float current_amps; // estimated actual current in amps

    inputStats.setWindowSecs( windowLength );
    float Energy;
    unsigned long prev_pub_time;

    while( true ) {
      sensorValue = analogRead(ACS_pin);  // read the analog in value:
      inputStats.input(sensorValue);  // log to Stats function            
      // if((unsigned long)(millis() - previousMillis) >= printPeriod) {
      //   previousMillis = millis();   // update time      
        current_amps = intercept + slope * inputStats.sigma();
        current_amps = sqrt(current_amps*current_amps);        
        float cur = (int)(current_amps*10);
        cur = (float)cur/10;
        Energy = cur*Volt_In/3600;
        //Serial.println(Energy);
        appMgr->energy += Energy;
        // total_energy_consumed += Energy;
        // appMgr->energy = total_energy_consumed;
        
        if( (appMgr->switch_val==0) && ((unsigned long)(millis() - prev_pub_time) >= PUBLISH_INTERVAL_OFF)) { 
           //  Serial.println(appMgr->energy);
             eMonitorig(appMgr); 
             prev_pub_time = millis();            
        }


        if( (appMgr->switch_val==1) && ((unsigned long)(millis() - prev_pub_time) >= PUBLISH_INTERVAL_ON)) { 
           //   Serial.println(appMgr->energy);
                eMonitorig(appMgr); 
                prev_pub_time = millis();            
        }


                        
      // }
     }

}

void resetEnergy(appManager* appMgr) {
  //Serial.println("Energy reset to 0");
  appMgr->energy = 0;
}






