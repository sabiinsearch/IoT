#include "Arduino.h"

#include <WiFi.h>   // for WiFi
#include <WiFiManager.h> 

#include <PubSubClient.h>   // for Mqtt
#include <ArduinoJson.h>
#include "app_config.h"     // for Custom Configration
#include "receiverBoard.h"

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

// Variables

// Set flags for Communication and getting values from app_config.h
     bool Radio_status = RADIO_AVAILABILITY;    
     bool BLE_status = BLE_AVAILIBILITY;
     bool WiFi_status = WIFI_AVAILABILITY;
     bool MQTT_status = MQTT_AVAILABILITY;


String BOARD_ID;
WiFiClient wifiClient;
// PubSubClient client(server, 1883, NULL, wifiClient);
PubSubClient pub_sub_client(wifiClient);
WiFiManager wm; // WiFi Manager 

String sub_topic = SUB_TOPIC;
String pub_topic = PUB_TOPIC;
char server[] = SERVER;
char apName[] = APNAME;
char mqttUser[] = MQTT_USER;
char mqttPassword[] = MQTT_PASSWORD;

/** Connection status */
volatile bool wifi_connected = false;
volatile bool mqtt_connected = false;


void initWiFi() {
  WiFi.mode(WIFI_STA); // explicitly set mode, esp defaults to STA+AP  
}
/**
 * Connect to MQTT Server
 */
 bool connectMQTT(bool wifi_connection_status, bool mqtt_connection_status) {
  
  if(wifi_connection_status && !mqtt_connection_status){
    if(BOARD_ID == ""){
      BOARD_ID = String(apName);
    }
     String clientId = "d:" ORG ":" BOARD_TYPE ":" +BOARD_ID;
     // String clientId = BOARD_ID;
     Serial.print("Connecting MQTT client: ");
     Serial.println(clientId);
     // mqttConnected = client.connect((char*) clientId.c_str(), token, "");
     mqtt_connected = pub_sub_client.connect((char*) clientId.c_str(), mqttUser, mqttPassword);
     if(mqtt_connected){
       digitalWrite(BLE_LED,HIGH);   
       pub_sub_client.subscribe(sub_topic.c_str());
       Serial.print("Subscribed to : >>  ");
       Serial.println(sub_topic);
     }
     Serial.print("MQTT Status: >>> ");
     Serial.print(pub_sub_client.state());
     mqtt_connected = true;
     // Serial.println(mqttConnected);
  }else{
    digitalWrite(BLE_LED,LOW);
    Serial.println("Cannot connect to MQTT as WiFi is not Connected !!");
  }
    return mqtt_connected;
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
        digitalWrite(WIFI_LED,HIGH);  
        wifi_connected = true;   
        Serial.println("connected...yeey :)");
    }
}

bool connectWiFi() {
  bool res;
  res = wm.autoConnect("Tank_Board"); // auto generated AP name from chipid
    if(!res) {
        digitalWrite(WIFI_LED,LOW);   
        reconnectWiFi();        
    }
    else {
        //if you get here you have connected to the WiFi         
        wifi_connected = true;
        digitalWrite(WIFI_LED,HIGH);   
        Serial.println("connected...yeey :)");        
    }
     return res;
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

//  mqtt methods
void mqttCallback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived in topic [");
  Serial.print(topic);
  Serial.print("] ");

  StaticJsonBuffer<200> mqttDataBuffer;
  JsonObject& jsonData = mqttDataBuffer.parseObject(payload);
  Serial.print(" >>> type: ");
  Serial.print(jsonData["type"].as<String>());
  Serial.print(", uniqueId: ");
  Serial.print(jsonData["uniqueId"].as<String>());
  Serial.print(", deviceIndex: ");
  Serial.print(jsonData["deviceIndex"].as<int>());
  Serial.print(", deviceValue: ");
  Serial.println(jsonData["deviceValue"].as<int>());

  if(jsonData["type"].as<String>() == BOARD_TYPE && jsonData["uniqueId"].as<String>() == BOARD_ID){
    Serial.println("<<<< SWITCH ACTION ON BOARD MATCHES >>>>");
    int deviceIndex = jsonData["deviceIndex"].as<int>();
    int deviceValue = jsonData["deviceValue"].as<int>();

    int deviceAction = 1;
    if(deviceValue == 1){
      deviceAction = 0;
    }

    switch (deviceIndex) {
      case 1:
          digitalWrite(SW_pin, deviceAction);          
          // switch_value = deviceAction;
        break;
      default:
        Serial.println("Device index not matched .... ");
      }
   }
   mqttDataBuffer.clear();
}

/**
 * Create unique device name from MAC address
 **/
/*
void createName() {
	uint8_t baseMac[6];
	// Get MAC address for WiFi station
	esp_read_mac(baseMac, ESP_MAC_WIFI_STA);
	// Write unique name into apName
	sprintf(apName, "SB_MICRO-%02X%02X%02X%02X%02X%02X", baseMac[0], baseMac[1], baseMac[2], baseMac[3], baseMac[4], baseMac[5]);

  BOARD_ID = String(apName);
  // pub_topic = PUBSUB_PREFIX + BOARD_ID +"/evt/cloud/fmt/json";
  // sub_topic = PUBSUB_PREFIX + BOARD_ID +"/cmd/device/fmt/json";
  // strcat(sub_topic, BOARD_ID.c_str() );
  // strcat(pub_topic, BOARD_ID.c_str() );
}
*/



void publishOnMqtt(String data) {

   bool published = false;
   
     if(pub_sub_client.publish(pub_topic.c_str(), (char*) data.c_str())){
       Serial.print("Published payload to Topic[");
       Serial.print(pub_topic);
       Serial.print("]: ");
       Serial.println(data);
       published = true;
     }else{
       Serial.print("Publish failed: \t");
          if (!!!pub_sub_client.connected() && MQTT_status) {
            Serial.print(" Wifi : ");
            Serial.print(wifi_connected);
            Serial.print("\t");
            Serial.print(" mqtt : ");
            Serial.println(mqtt_connected);

            mqtt_connected = connectMQTT(wifi_connected,mqtt_connected);
          }
       // Serial.println(data);
     }
  
}

void publishData(String data) {

     publishOnRadio(data,RADIO_AVAILABILITY);
     
     publishOnMqtt(data);

}


void print_communication() {
     Serial.println("from Communication_lib");
  }