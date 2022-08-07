#include "Arduino.h"

#include <WiFi.h>   // for WiFi
#include <WiFiManager.h> 

#include <LoRa.h>


//static int taskCore = 0;


#define BAND    433E6
#define SCK     5
#define MISO    19
#define MOSI    27
#define CS      18

#define SS      18
#define RST     14
#define DI0     26


WiFiManager wm; // WiFi Manager 

void initWiFi() {
  WiFi.mode(WIFI_STA); // explicitly set mode, esp defaults to STA+AP  
}

void reconnectWiFi(){
  bool res;
  wm.resetSettings(); // reset settings - wipe stored credentials for testing, these are stored by the esp library
  res = wm.autoConnect("Tank_Board"); // anonymous ap
    if(!res) {
        Serial.println("Failed to connect");
        // ESP.restart();
    } 
    else {
        //if you get here you have connected to the WiFi    
        Serial.println("connected...yeey :)");
    }
}

void connectWiFi(){
  bool res;
  res = wm.autoConnect("Tank_Board"); // auto generated AP name from chipid
    if(!res) {
        reconnectWiFi();
    } 
    else {
        //if you get here you have connected to the WiFi    
        Serial.println("connected...yeey :)");
    }

}

void reset_wifi() {
    wm.resetSettings();
}

bool initRadio(bool enableRadioablity){
  bool radioAvailablity ;
  SPI.begin(SCK, MISO, MOSI, CS);
  LoRa.setPins(SS, RST, DI0);
      delay(1000);
  if(enableRadioablity){
      int radioTryCount = 0;      
      do{
        radioAvailablity = LoRa.begin(BAND);
        radioTryCount++;
        if(!radioAvailablity){
          Serial.printf("Starting Radio failed!, Try Count: %d\n", radioTryCount);
          delay(3000);
        }else{
          Serial.println("Radio Initialized Successfully...");
        }
      }while(!radioAvailablity && radioTryCount < 3);
  }
  return radioAvailablity;
}

char* string2char(String str){
  char *p;
    if(str.length()!=0) {
        p = const_cast<char*>(str.c_str());
    }
    return p;
}

 void publishOnRadio(String data, bool radioAvailability){
    bool published = false;

    if(radioAvailability && !published){
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
        //// Serial.println(LoRa.packetRssi());
    }
}

void publishOnMqtt(bool enbMqtt) {

}
void print_communication() {
     Serial.println("from Communication_lib");
  }