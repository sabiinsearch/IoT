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
  }

}

/**
 * Logic that runs in Loop
 */
void loop() {
    checkDataOnRadio();
    checkTouchDetected();
    check_WT();
}
