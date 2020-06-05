#include <Arduino.h>
#include <stdlib.h>
#include <SPI.h>
#include <LoRa.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include "EEPROM.h"

#define BAND    433E6
#define SCK  5
#define MISO  19
#define MOSI  27
#define CS  18

#define SS  18
#define RST     14
#define DI0     26

#ifdef __cplusplus
extern "C" {
#endif
uint8_t temprature_sens_read();
#ifdef __cplusplus
}
#endif
uint8_t temprature_sens_read();

static int taskCore = 0;
String sensorsData = "";
bool enableLora = true;
bool enableWiFi = false;
bool enableEEPROM = true;

unsigned long interval = 1000; // the time we need to wait
unsigned long previousMillis = 0;

int sw1Address = 0;
int sw2Address = 1;
int sw3Address = 2;
int sw4Address = 3;
int EEPROM_SIZE = 64;

String receivedText;
bool loraAvailable = false;
bool eepromAvailable = false;
int wifiTryCount = 0;
int mqttTryCount = 0;
int wifiStatus = WL_IDLE_STATUS;

#define HEARTBEAT_LED  32
bool hbLedState = LOW;

unsigned long previousTouchMillis = 0;

#define touch1 4 // Pin for capactitive touch sensor
#define touch2 2 // Pin for capactitive touch sensor
#define touch3 13 // Pin for capactitive touch sensor
#define touch4 15 // Pin for capactitive touch sensor

int SW1 = 16;
int SW2 = 17;
int SW3 = 23;
int SW4 = 12;

int sw1Val = 0;
int sw2Val = 0;
int sw3Val = 0;
int sw4Val = 0;

boolean lastState1 = LOW;
boolean lastState2 = LOW;
boolean lastState3 = LOW;
boolean lastState4 = LOW;

#define ORG "rqeofj"
#define BOARD_TYPE "HB_ESP32"
#define TOKEN "1SatnamW"

char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/espboard/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = "P@ssw0rd"; // Auth token of Device registered on Watson IoT Platform

String BOARD_ID;
WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);

const char* ssid = "GurvinderNet";
const char* password =  "1SatnamW";

// -----------------------------

int hallData = 0;
int boardTemp = 0;

// --------------------

/**
 * Scan WiFi Networks
 */
static void scanWiFi(){
  int n = WiFi.scanNetworks();

  if (n == 0) {
    Serial.println("Searching networks.");
  } else {
    Serial.println("Networks found: ");
    for (int i = 0; i < n; ++i) {
//      Print SSID for each network found
      char currentSSID[64];
      WiFi.SSID(i).toCharArray(currentSSID, 64);
      Serial.println(currentSSID);
    }
  }
  // Wait a bit before scanning again
  delay(5000);
}

/**
 * Connect to a given WiFi Network
 */
static void connectWiFi(){
  while(wifiStatus != WL_CONNECTED && wifiTryCount < 5){
        Serial.print("Attempting to connect to WEP network, SSID: ");
        Serial.println(ssid);
        wifiStatus = WiFi.begin(ssid, password);
        wifiTryCount++;
        delay(10000);
  }

  wifiTryCount = 0;

  if(wifiStatus == WL_CONNECTED){
    Serial.println("WiFi Connected..");
  }else{
    Serial.println("Failed to Connect WiFi");
  }
}

/**
 * Connect to MQTT Server
 */
static void connectMQTT() {
  // Serial.print("IN connecting MQTT client...");
  if(BOARD_ID == ""){
    char chipid[20];
    sprintf(chipid, "%" PRIu64, ESP.getEfuseMac());
    BOARD_ID = "HB_"+String(chipid);
  }
 String clientId = "d:" ORG ":" BOARD_TYPE ":" +BOARD_ID;
 if (!!!client.connected()) {
   Serial.print("Reconnecting MQTT client to ");
   Serial.println(server);
   while (!!!client.connect((char*) clientId.c_str(), authMethod, token)) {
     Serial.print("Connecting: ");
     Serial.println(BOARD_ID);
     delay(500);
   }
   // Serial.println();
 }
 Serial.print("MQTT Connected...");
}

void publishData(String data){
  Serial.print("Publish data:>> ");
  Serial.println(data);
     /*
   if (client.publish(topic, (char*) payload.c_str())) {
       // Serial.print("Published payload: ");
       // Serial.println(payload);
     } else {
       // Serial.println("Publish failed: ");
       // Serial.println(payload);
     }
  */

    if(loraAvailable){
        LoRa.beginPacket();
//        LoRa.write(destination);              // add destination address
//        LoRa.write(localAddress);
        LoRa.print(data);
        LoRa.print("\n");
        LoRa.endPacket();
//        LoRa.receive();
        delay(1);
        LoRa.flush();
    }else{
       Serial.print("Lora Not Working: >> ");
       Serial.println(data);
    }
}

void checkDataOnLora(){
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

void initSwitches(){
  if(eepromAvailable){
    sw1Val = EEPROM.readInt(sw1Address);
    sw2Val = EEPROM.readInt(sw2Address);
    sw3Val = EEPROM.readInt(sw3Address);
    sw4Val = EEPROM.readInt(sw4Address);
  }

  if(sw1Val < 0){
    sw1Val = 0;
  }
  if(sw2Val < 0){
    sw2Val = 0;
  }
  if(sw3Val < 0){
    sw3Val = 0;
  }
  if(sw4Val < 0){
    sw4Val = 0;
  }

  if(sw1Val > 1){
    sw1Val = 1;
  }
  if(sw2Val > 1){
    sw2Val = 1;
  }
  if(sw3Val > 1){
    sw3Val = 1;
  }
  if(sw4Val > 1){
    sw4Val = 1;
  }

    digitalWrite (SW1, sw1Val);
    digitalWrite (SW2, sw2Val);
    digitalWrite (SW3, sw3Val);
    digitalWrite (SW4, sw4Val);
    // Serial.printf("Switch 1: %d, Switch 2: %d, Switch 3: %d, Switch 4: %d\n\n", sw1Val, sw2Val, sw3Val, sw4Val);

}

void checkSW1(){
  boolean currentState = digitalRead(touch1);
  if (currentState == HIGH && lastState1 == LOW){
    Serial.println("1 pressed");
    delay(1);
    if (sw1Val == 0){
      digitalWrite(SW1, 1);
      sw1Val = 1;
    } else {
      digitalWrite(SW1, 0);
      sw1Val = 0;
    }

    String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":1, \"deviceValue\": " +String(sw1Val)+"}";
    publishData(payload);
    if(eepromAvailable){
      EEPROM.writeInt(sw1Address, sw1Val);
      // Serial.printf("sw1Val: %d \n", EEPROM.readInt(sw1Address));
    }

  }
  lastState1 = currentState;
}

void checkSW2(){
  boolean currentState = digitalRead(touch2);
  if (currentState == HIGH && lastState2 == LOW){
    Serial.println("2 pressed");
    delay(1);
    if (sw2Val == 0){
      digitalWrite(SW2, 1);
      sw2Val = 1;
    } else {
      digitalWrite(SW2, 0);
      sw2Val = 0;
    }

    String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":2, \"deviceValue\": " +String(sw2Val)+"}";
    publishData(payload);
    if(eepromAvailable){
      EEPROM.writeInt(sw2Address, sw2Val);
      // Serial.printf("sw3Val: %d \n", EEPROM.readInt(sw3Address));
    }

  }
  lastState2 = currentState;
}

void checkSW3(){
  boolean currentState = digitalRead(touch3);
  if (currentState == HIGH && lastState3 == LOW){
    Serial.println("3 pressed");
    delay(1);
    if (sw3Val == 0){
      digitalWrite(SW3, 1);
      sw3Val = 1;
    } else {
      digitalWrite(SW3, 0);
      sw3Val = 0;
    }

    String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":3, \"deviceValue\": " +String(sw3Val)+"}";
    publishData(payload);
    if(eepromAvailable){
      EEPROM.writeInt(sw3Address, sw3Val);
      // Serial.printf("sw4Val: %d \n", EEPROM.readInt(sw3Address));
    }

  }
  lastState3 = currentState;
}

void checkSW4(){
  boolean currentState = digitalRead(touch4);
  if (currentState == HIGH && lastState4 == LOW){
    Serial.println("4 pressed");
    delay(1);
    if (sw4Val == 0){
      digitalWrite(SW4, 1);
      sw4Val = 1;
    } else {
      digitalWrite(SW4, 0);
      sw4Val = 0;
    }

    String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":4, \"deviceValue\": " +String(sw4Val)+"}";
    publishData(payload);
    if(eepromAvailable){
      EEPROM.writeInt(sw4Address, sw4Val);
      // Serial.printf("sw4Val: %d \n", EEPROM.readInt(sw4Address));
    }

  }
  lastState4 = currentState;
}

void checkTouchDetected(){
  checkSW1();
  checkSW2();
  checkSW3();
  checkSW4();
}

// the setup function runs once when you press reset or power the board
void setup() {
  delay(500);

  pinMode(HEARTBEAT_LED, OUTPUT);
  pinMode(SW1, OUTPUT);
  pinMode(SW2, OUTPUT);
  pinMode(SW3, OUTPUT);
  pinMode(SW4, OUTPUT);

  pinMode(touch1, INPUT);
  pinMode(touch2, INPUT);
  pinMode(touch3, INPUT);
  pinMode(touch4, INPUT);

  // Init Lora
  if(enableLora){
      SPI.begin(SCK, MISO, MOSI, CS);
      LoRa.setPins(SS, RST, DI0);
      delay(1000);
  }

  Serial.begin(115200);
  while (!Serial);
  delay(1000);

  char chipid[20];
  sprintf(chipid, "%" PRIu64, ESP.getEfuseMac());
  BOARD_ID = "HB_"+String(chipid);
  // Serial.println(BOARD_ID);
  delay(100);

  if(enableEEPROM){
      int eepromTryCount = 0;
      do{
        eepromAvailable = EEPROM.begin(EEPROM_SIZE);
        eepromTryCount++;
        if(!eepromAvailable){
          Serial.printf("Failed to initialise EEPROM, Try Count: %d\n", eepromTryCount);
          delay(2000);
        }else{
          Serial.println("EEPROM Initialized Successfully...");
        }
      }while(!eepromAvailable && eepromTryCount > 3);
  }

  initSwitches();

  // Serial.println("LoRa Initializing...");
  if(enableLora){
      int loraTryCount = 0;
      do{
        loraAvailable = LoRa.begin(BAND);
        loraTryCount++;
        if(!loraAvailable){
          Serial.printf("Starting LoRa failed!, Try Count: %d\n", loraTryCount);
          delay(3000);
        }else{
          Serial.println("LoRa Initialized Successfully...");
        }
      }while(!loraAvailable && loraTryCount < 3);
  }

  if(enableWiFi){
        // Set WiFi to station mode and disconnect from an AP if it was previously connected
  //      WiFi.mode(WIFI_STA);
  //      WiFi.disconnect();
        delay(100);

  //      scanWiFi();
        connectWiFi();
         if(wifiStatus == WL_CONNECTED){
//            connectMQTT();
         }
  }

}

  // the loop function runs over and over again forever
  void loop() {
    unsigned long currentMillis = millis();
//      checkDataOnLora();
      checkTouchDetected();
      if ((unsigned long)(currentMillis - previousMillis) >= (interval * 5)) {
           if(hbLedState == LOW){
               digitalWrite(HEARTBEAT_LED, 1);
               hbLedState = HIGH;
           }else{
               digitalWrite(HEARTBEAT_LED, 0);
               hbLedState = LOW;
           }
           previousMillis =  millis();
      }

      //  scanWiFi();
      // Serial.println(BOARD_ID);

  }
