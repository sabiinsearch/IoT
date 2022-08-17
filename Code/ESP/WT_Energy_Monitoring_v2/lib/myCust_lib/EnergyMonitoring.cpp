#include "EnergyMonitoring.h"
#include "Arduino.h"

#include "app_config.h"
#include "appManager.h"
#include "receiverBoard.h"      // for using cust_board pins

// for Energy Monitoring
#include <ACS712.h>
#include <Filters.h>
#include <stdio.h>

ACS712 sensor(ACS712_20A, ACS_pin);
char watt[5];
unsigned long last_time =0;
unsigned long current_time =0;
float Volt_In = VOLTAGE_IN;
float Wh =0 ;
float Energy;
// unsigned long publish_time = PUBLISH_INTERVAL;     // from app_config.h
// unsigned long prev_pub_time = 0 ;

// Another reference
float testFrequency = 40;                     // test signal frequency (Hz)
float windowLength = 90.0/testFrequency;     // how long to average the signal, for statistist
int sensorValue = 0;
double intercept = -0.0529009; // to be adjusted based on calibration testing
float slope = 0.0975599997; // to be adjusted based on calibration testing
float current_amps; // estimated actual current in amps

   // unsigned long printPeriod = 1000; // in milliseconds
// Track time in milliseconds since last reading
   // unsigned long previousMillis = 0;

// varialble for Energy Monitoring
volatile unsigned long total_energy_consumed;



  unsigned long getEngergy() {
    
    unsigned long totalEnergyTillNow = total_energy_consumed;
    setEnergy();
    return totalEnergyTillNow;
}

// Energy Consumption

 void eMonitorig(appManager* appMgr) {
    unsigned long prev_pub_time = 0 ;
   do{    // when switch is ON
        broadcast_appMgr(appMgr);
        setEnergy();   
    }while((appMgr->switch_val==1));
 }

 void energy_consumption(void * pvParameters) { 
    
    appManager* appMgr = (appManager*)pvParameters; 
    RunningStatistics inputStats;                 // create statistics to look at the raw test signal
    inputStats.setWindowSecs( windowLength );
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
        total_energy_consumed += Energy;
        appMgr->energy = total_energy_consumed;
          if( (appMgr->switch_val==1) && ((unsigned long)(millis() - prev_pub_time) >= PUBLISH_INTERVAL)) { 
                  eMonitorig(appMgr); 
                  prev_pub_time = millis();            
          }
          
      // }
     }

}

void setEnergy() {
  //total_energy_consumed = 0;
}






