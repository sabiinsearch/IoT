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

ACS712 sensor(ACS712_20A, 34);
char watt[5];
unsigned long last_time =0;
unsigned long current_time =0;
float Wh =0 ;
String Energy;

// Another reference
float testFrequency = 60;                     // test signal frequency (Hz)
float windowLength = 20.0/testFrequency;     // how long to average the signal, for statistist
int sensorValue = 0;
float intercept = -0.0700; // to be adjusted based on calibration testing
float slope = 0.0800; // to be adjusted based on calibration testing
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
    if(str.length()!=0){
        char *p = const_cast<char*>(str.c_str());
        return p;
    }
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
    Energy = "Energy: ";
    while( true ) {
      sensorValue = analogRead(A0);  // read the analog in value:
      inputStats.input(sensorValue);  // log to Stats function

      if((unsigned long)(millis() - previousMillis) >= printPeriod) {
        previousMillis = millis();   // update time

        // display current values to the screen
        //Serial.print( "\n" );
        // output sigma or variation values associated with the inputValue itsel
        //Serial.print( "\tsigma: " ); Serial.print( inputStats.sigma() );
        // convert signal sigma value to current in amps
        current_amps = intercept + slope * inputStats.sigma();
        Energy += ( (current_amps*230) *0.95);
        publishData(Energy);
        // Serial.print( "\tamps: " ); Serial.print( current_amps );
        // Serial.print( "\tWatt: " ); Serial.print( (current_amps*230) *0.95);
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
  Serial.println(Vout);
  String volt_level = "Tank_Level";
  volt_level += Vout;
  publishData(volt_level);
 }

 void checkTouchDetected(){
  if(digitalRead(touch1) == HIGH){
        //publishData("Hello Wold");
        //Serial.println("TouchDetected & Msg Sent on LoRa");
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

  Serial.begin(115200);
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
  //  ernergy_consumption();
    while(1) {
      check_WT();
      delay(1000);
    }
}
