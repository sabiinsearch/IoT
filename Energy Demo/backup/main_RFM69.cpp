#include <Arduino.h>
#include <stdlib.h>
#include <RFM69.h>
#include <RFM69_ATC.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include "EEPROM.h"
#include <SPI.h>

#define RFM69_CS      18
#define RFM69_IRQ     26
#define RFM69_IRQN    digitalPinToInterrupt(RFM69_IRQ)
#define RFM69_RST     14

//*********************************************************************************************
//************ IMPORTANT SETTINGS - YOU MUST CHANGE/CONFIGURE TO FIT YOUR HARDWARE *************
//*********************************************************************************************
#define NODEID        2    //unique for each node on same network
#define NETWORKID     200  //the same on all nodes that talk to each other
#define GATEWAYID     1
//Match frequency to the hardware version of the radio on your Moteino (uncomment one):
#define FREQUENCY     RF69_433MHZ
//#define FREQUENCY     RF69_868MHZ
//#define FREQUENCY     RF69_915MHZ
#define IS_RFM69HW    //uncomment only for RFM69HW! Leave out if you have RFM69W!
//*********************************************************************************************
//Auto Transmission Control - dials down transmit power to save battery
//Usually you do not need to always transmit at max output power
//By reducing TX power even a little you save a significant amount of battery power
//This setting enables this gateway to work with remote nodes that have ATC enabled to
//dial their power down to only the required level
//#define ENABLE_ATC    //comment out this line to disable AUTO TRANSMISSION CONTROL
//*********************************************************************************************

// AES encryption (or not):

#define ENCRYPT       true // Set to "true" to use encryption
#define ENCRYPTKEY    "TOPSECRETPASSWRD" // Use the same 16-byte key on all nodes

// Use ACKnowledge when sending messages (or not):

#define USEACK        true // Request ACKs or not

#ifdef ENABLE_ATC
  RFM69_ATC radio;
#else
  RFM69 radio;
#endif

bool promiscuousMode = false; //set to 'true' to sniff all packets on the same network

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

#define ORG "rqeofj"
#define BOARD_TYPE "HB_ESP32"
#define TOKEN "1SatnamW"

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

  char copy[data.length()];
  data.toCharArray(copy, data.length());

  if(loraAvailable){
//        rf69.send((uint8_t *)copy, strlen(copy));
//        rf69.waitPacketSent();
        if (radio.sendWithRetry(GATEWAYID, (const void*)(&copy), sizeof(copy)))
              Serial.print(" ok!");
        else Serial.print(" nothing...");
    }else{
       Serial.print("Lora Not Working: >> ");
       Serial.println(data);
    }
}

uint32_t packetCount = 0;
void checkDataOnLora(){
  // Should be a message for us now
   if (radio.receiveDone()){
        Serial.print("#[");
        Serial.print(++packetCount);
        Serial.print(']');
        Serial.print('[');Serial.print(radio.SENDERID, DEC);Serial.print("] ");
        if (promiscuousMode)
        {
          Serial.print("to [");Serial.print(radio.TARGETID, DEC);Serial.print("] ");
        }
        for (byte i = 0; i < radio.DATALEN; i++)
          Serial.print((char)radio.DATA[i]);
        Serial.print("   [RX_RSSI:");Serial.print(radio.RSSI);Serial.print("]");
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

  Serial.begin(115200);
  while (!Serial);
  delay(1000);

  // Init Lora
  if(enableLora){
      radio = RFM69(RFM69_CS, RFM69_IRQ, false, RFM69_IRQN);
      pinMode(RFM69_RST, OUTPUT);
      digitalWrite(RFM69_RST, HIGH);
      // delay(100);
      delayMicroseconds(100);
      digitalWrite(RFM69_RST, LOW);
      delay(100);
  }

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
        loraAvailable = radio.initialize(FREQUENCY,NODEID,NETWORKID);
        loraTryCount++;
        if(!loraAvailable){
          Serial.printf("Starting Radio failed!, Try Count: %d\n", loraTryCount);
          delay(3000);
        }else{
          Serial.println("Radio Initialized Successfully...");
        }
      }while(!loraAvailable && loraTryCount < 3);

      #ifdef IS_RFM69HW
        radio.setHighPower(); //only for RFM69HW!
      #endif

      radio.setPowerLevel(31);
      radio.encrypt(ENCRYPTKEY);

      //radio.promiscuous(promiscuousMode);
      char buff[50];
      sprintf(buff, "\nListening at %d Mhz...", FREQUENCY==RF69_433MHZ ? 433 : FREQUENCY==RF69_868MHZ ? 868 : 915);
      Serial.println(buff);
      Serial.print("Network "); Serial.println(NETWORKID);
      Serial.print("Node "); Serial.println(NODEID);
      Serial.print("Encryptkey "); Serial.println(ENCRYPTKEY);

      Serial.println();

      #ifdef ENABLE_ATC
        Serial.println("RFM69_ATC Enabled (Auto Transmission Control)");
      #endif

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
