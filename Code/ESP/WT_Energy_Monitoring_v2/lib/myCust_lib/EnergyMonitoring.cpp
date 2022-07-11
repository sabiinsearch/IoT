#include "EnergyMonitoring.h"

#include "Arduino.h"

#include "receiverBoard.h"      // for using cust_board pins

// for Energy Monitoring
#include <ACS712.h>
#include <Filters.h>
#include <stdio.h>

ACS712 sensor(ACS712_20A, ACS_pin);
char watt[5];
unsigned long last_time =0;
unsigned long current_time =0;
float Wh =0 ;
String Energy;

// Another reference
float testFrequency = 55;                     // test signal frequency (Hz)
float windowLength = 10.0/testFrequency;     // how long to average the signal, for statistist
int sensorValue = 0;
double intercept = 0.00009999199919; // to be adjusted based on calibration testing
float slope = 0.0316599997; // to be adjusted based on calibration testing
float current_amps; // estimated actual current in amps

unsigned long printPeriod = 1000; // in milliseconds
// Track time in milliseconds since last reading
unsigned long previousMillis = 0;

// varialble for Energy Monitoring
static float total_energy_consumed;


// Energy Consumption
void energy_consumption(void * pvParameters) { 


    RunningStatistics inputStats;                 // create statistics to look at the raw test signal
    inputStats.setWindowSecs( windowLength );
    
    while( true ) {
  //    float I = sensor.getCurrentAC(50);

      Energy = "Current: ";
      sensorValue = analogRead(ACS_pin);  // read the analog in value:
      inputStats.input(sensorValue);  // log to Stats function      
      
      
      if((unsigned long)(millis() - previousMillis) >= printPeriod) {
        previousMillis = millis();   // update time      
        current_amps = intercept + slope * inputStats.sigma();
        // Energy += ( (current_amps*230) *0.95);
        // Serial.print(Energy);
        // Serial.print("\t");
        //Serial.print("Current: ");
        printf("Current = %.3f\n",current_amps);
       // Serial.println(roundf(current_amps*1000)/1000);
//        publishData(Energy);
 //       publishData((Energy+current_amps));
 //  //     printf("%.3lf",current_amps);
      }
     }


/*   float value = analogRead(ACS_pin);
     total_energy_consumed += value;
     Serial.print("Energy = ");
     Serial.println(total_energy_consumed);
*/

/*
   float V = 230;
   float I = sensor.getCurrentAC();
  // Serial.print("Current: ");
  // Serial.print(I);
   float P = V * I;
   last_time = current_time;
   current_time = millis();
   Wh = Wh+  P *(( current_time -last_time) /3600000.0) ;
    dtostrf(Wh, 4, 2, watt);
    Energy = "Energy: ";
    Energy += watt;
    publishData(Energy);
   Serial.print("  Energy: ");
   Serial.print(watt);
   Serial.println();
   delay(500);
*/
}



