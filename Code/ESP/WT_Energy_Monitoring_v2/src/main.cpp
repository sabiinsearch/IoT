// Default Arduino includes
#include <Arduino.h>
#include <WiFi.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>
#include <stdlib.h>
#include <SPI.h>
#include <LoRa.h>
#include <PubSubClient.h>

// for Energy Monitoring
#include <ACS712.h>
#include <Filters.h>
#include <stdio.h>

ACS712 sensor(ACS712_20A, 34);
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

#include <Preferences.h>

#define BAND    433E6
#define SCK     5
#define MISO    19
#define MOSI    27
#define CS      18

#define SS      18
#define RST     14
#define DI0     26


//static int taskCore = 0;
bool radioAvailable = false;
bool enableRadio = true;
bool enableBLE = true;
bool enableWiFi = true;
bool enableMQTT = false;

unsigned long interval = 5; // the time we need to wait
//unsigned long previousMillis = 0;
unsigned long previousTouchMillis = 0;

// variables for Water Tank
int raw;
int Vin = 3.3;
float Vout = 0.0;
float buffer = 0;
int level;


// #define HEARTBEAT_LED  32
#define HEARTBEAT_LED  25
#define WIFI_LED  32
#define BLE_LED  33

// varialble for Energy Monitoring
#define ACS_pin  34  // Energy Sensor
static float total_energy_consumed;
#define touch1 4 // Pin for capactitive touch sensor
#define WT_sensor 15
bool hbLedState = LOW; // Heartbeat LED state

int SW2 = 16;

int sw2Val = 1;

boolean lastState2 = LOW;

bool usePrimAP = true; // use primary or secondary WiFi network

char* string2char(String str){
  char *p;
    if(str.length()!=0) {
        p = const_cast<char*>(str.c_str());
    }
    return p;
}


void initRadio(){
  if(enableRadio){
      int radioTryCount = 0;
      do{
        radioAvailable = LoRa.begin(BAND);
        radioTryCount++;
        if(!radioAvailable){
          Serial.printf("Starting Radio failed!, Try Count: %d\n", radioTryCount);
          delay(3000);
        }else{
          Serial.println("Radio Initialized Successfully...");
        }
      }while(!radioAvailable && radioTryCount < 3);
  }
}

 void publishData(String data){
    bool published = false;

    if(radioAvailable && !published){
        LoRa.beginPacket();

        LoRa.print(data);
        LoRa.print("\n");
        LoRa.endPacket();

        delay(1);
        LoRa.flush();
    }else{
       Serial.print("Radio Not Available: >> ");
    }
}

void ernergy_consumption(void * pvParameters) {

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
 //       printf("%.3lf",current_amps);
      }
     }

/*   float value = analogRead(ACS_pin);
     total_energy_consumed += value;
     Serial.print("Energy = ");
     Serial.println(total_energy_consumed);
*/
    /**
    * Logic that runs in Loop
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

void checkDataOnRadio(){
  String receivedText;
  // try to parse packet
    int packetSize = LoRa.parsePacket();
    if (packetSize) {
        // received a packet
        // Serial.print("Received packet '");
        // read packet
        while (LoRa.available()) {
          receivedText = (char)LoRa.read();
          Serial.print(receivedText);
        }

        // print RSSI of packet
        // Serial.print("' with RSSI ");
        // Serial.println(LoRa.packetRssi());
    }
}


 void check_WT() {
  raw = analogRead(WT_sensor);
//  if(raw){
  buffer = raw * Vin;
  Vout = (buffer)/1024.0;
  Serial.print("Raw: ");
  Serial.print(raw);
  Serial.print("\t");
  Serial.print("Vout: ");
  Serial.print(Vout);
  String volt_level = "Tank_Level";
  volt_level += Vout;
  Serial.print("\t");
  Serial.println(volt_level);
  publishData(volt_level);
 }

 void checkTouchDetected(){
  if(digitalRead(touch1) == HIGH){
        publishData("pressed");
        Serial.println("pressed");
        check_WT();
        if (sw2Val == 0){
          digitalWrite(SW2, 1);
          sw2Val = 1;
        } else {
          digitalWrite(SW2, 0);
          sw2Val = 0;
        }

        delay(500);
  }
 }

void setup() {

  Serial.begin(9800);
  while (!Serial);
  delay(1000);
	// Send some device info
	Serial.print("Build: ");

  pinMode(HEARTBEAT_LED, OUTPUT);
  pinMode(WIFI_LED, OUTPUT);
  pinMode(BLE_LED, OUTPUT);
  pinMode(SW2, OUTPUT);
  pinMode(touch1, INPUT);
  pinMode(WT_sensor, INPUT);
  pinMode(A0,INPUT);
  pinMode(ACS_pin,INPUT);
  

  //digitalWrite(touch1, 0);
  digitalWrite(SW2, 1);
  // Init Lora
  if(enableRadio){

      SPI.begin(SCK, MISO, MOSI, CS);
      LoRa.setPins(SS, RST, DI0);
      delay(1000);
      initRadio();
      Serial.print(" Ready to print ");

  // Define Energy Monitoring in Core 2
  xTaskCreatePinnedToCore(ernergy_consumption, "Task2", 10000, NULL, 1, NULL,  1);
  }

}

/**
 * Logic that runs in Loop
 */
void loop() {
    checkDataOnRadio();
    checkTouchDetected();
    //ernergy_consumption();
    //while(1) {
    //  check_WT();
      delay(1000);
    //}
}
