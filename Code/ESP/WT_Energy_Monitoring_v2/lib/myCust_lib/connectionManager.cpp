#include <ArduinoJson.h>
#include "connectionManager.h"

#include <WiFi.h>   // for WiFi
#include <WiFiManager.h> 
#include <LoRa.h>
#include <PubSubClient.h>   // for Mqtt

#include "app_config.h"     // for Custom Configration
#include "receiverBoard.h"




#define BAND    433E6
#define SCK     5
#define MISO    19
#define MOSI    27
#define CS      18

#define SS      18
#define RST     14
#define DI0     26

/*  */

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


/* constructor implementation */

connectionManager * const connectionManager_ctor(connectionManager * const me ) {

   // me->ble_status = ble_status;
    
      // Init Lora

   if(RADIO_AVAILABILITY){
      initRadio(me);
      Serial.print(" Ready to print ");
   }


   // Init WiFi
   if(WIFI_AVAILABILITY) {
       initWiFi();
       connectWiFi(me);
       if(me->Wifi_status) {
           Serial.println("Wifi connected");
       }
   }

  // Init Mqtt
  if(MQTT_AVAILABILITY) {
    pub_sub_client.setServer(server, 1883);
    pub_sub_client.setCallback(mqttCallback);
    connectMQTT(me);
    if(me->mqtt_status) {
        Serial.println("mqtt connected");
    }
  }
  
   return me;
}

/* Function implementation */


void initWiFi() {
  WiFi.mode(WIFI_STA); // explicitly set mode, esp defaults to STA+AP  
}

/**
 * Connect to MQTT Server
 */
 bool connectMQTT(connectionManager * con) {
  
  if(con->Wifi_status && !con->mqtt_status){
    if(BOARD_ID == ""){
      BOARD_ID = String(apName);
    }
     String clientId = "d:" ORG ":" BOARD_TYPE ":" +BOARD_ID;
     // String clientId = BOARD_ID;
     Serial.print("Connecting MQTT client: ");
     Serial.println(clientId);
     // mqttConnected = client.connect((char*) clientId.c_str(), token, "");
     con->mqtt_status = pub_sub_client.connect((char*) clientId.c_str(), mqttUser, mqttPassword);
     if(con->mqtt_status){
       digitalWrite(MQTT_LED,LOW);   
       pub_sub_client.subscribe(sub_topic.c_str());
       Serial.print("Subscribed to : >>  ");
       Serial.println(sub_topic);
     }else {
       digitalWrite(MQTT_LED,HIGH);
     }
     Serial.print("MQTT Status: >>> ");
     Serial.print(pub_sub_client.state());
     con->mqtt_status = true;
     // Serial.println(mqttConnected);
  }else{
    digitalWrite(MQTT_LED,HIGH);
    Serial.println("Cannot connect to MQTT as WiFi is not Connected !!");
  }
  return con->mqtt_status;
}

void reconnectWiFi(connectionManager  * con){
  bool res;
  wm.resetSettings(); // reset settings - wipe stored credentials for testing, these are stored by the esp library
  res = wm.autoConnect("Tank_Board"); // anonymous ap
    if(!res) {
        con->Wifi_status = false;
        digitalWrite(WIFI_LED,HIGH);
        Serial.println("Failed to connect");
        // ESP.restart();
    } 
    else {
        //if you get here you have connected to the WiFi  
        digitalWrite(WIFI_LED,LOW);  
        con->Wifi_status = true;   
       // Serial.println("connected...yeey :)");
    }
}

void connectWiFi(connectionManager * con) {
  bool res;
  digitalWrite(HEARTBEAT_LED,LOW);  
  res = wm.autoConnect("Tank_Board"); // auto generated AP name from chipid
    if(!res) { 
        reconnectWiFi(con);        
    }
    else {
        //if you get here you have connected to the WiFi         
        con->Wifi_status = true;
        digitalWrite(HEARTBEAT_LED,HIGH);
        digitalWrite(WIFI_LED,LOW);   
        //Serial.println("connected...yeey :)");        
    }
}

void resetWifi(connectionManager * con) {
    con->Wifi_status = false;
    digitalWrite(WIFI_LED,HIGH);
    reconnectWiFi(con);
}

void initRadio(connectionManager * con){
  SPI.begin(SCK, MISO, MOSI, CS);
  LoRa.setPins(SS, RST, DI0);
      delay(1000);

      int radioTryCount = 0;      
      do{
        con->radio_status = LoRa.begin(BAND);
        radioTryCount++;
        if(!con->radio_status){
          Serial.printf("Starting Radio failed!, Try Count: %d\n", radioTryCount);
          delay(3000);
        }else{
          Serial.println("Radio Initialized Successfully...");
        }
      }while(!con->radio_status && radioTryCount < 3);

}

char* string2char(String str){
  char *p;
    if(str.length()!=0) {
        p = const_cast<char*>(str.c_str());
    }
    return p;
}

 void publishOnRadio(String data, connectionManager * con){
    bool published = false;

    if(con->radio_status && !published){
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
     Serial.println("<<<< MQTT Instruction ON BOARD MATCHES >>>>");

     int switchValue = jsonData["switchValue"].as<int>();
     String instruction = jsonData["instruction"].as<String>();
     int instVal =  jsonData["instValue"].as<int>();
     
     if(instruction== "Switch") {
       if(switchValue == 1) {
           Serial.println("Switch On");   
       }else { 
          if(switchValue == 0) {
             Serial.println("Switch off");
          }
        }
     } 

     if(instruction== "CONFIG_PUBLISH_INTERVAL_ON") {
       PUBLISH_INTERVAL_ON = instVal;
     } 

     if(instruction== "CONFIG_PUBLISH_INTERVAL_OFF") {

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



void publishOnMqtt(String data, connectionManager * con) {

   bool published = false;
   
     if(pub_sub_client.publish(pub_topic.c_str(), (char*) data.c_str())){
       Serial.print("Published payload to Topic[");
       Serial.print(pub_topic);
       Serial.print("]: ");
       Serial.println(data);
       published = true;
     }else{
       Serial.print("Publish failed: \t");
          if (!!!pub_sub_client.connected() && MQTT_AVAILABILITY) {
            Serial.print(" Wifi : ");
            Serial.print(con->Wifi_status);
            Serial.print("\t");
            Serial.print(" mqtt : ");
            Serial.println(con->mqtt_status);

            connectMQTT(con);
          }
       // Serial.println(data);
     }
  
}

void publishData(String data, connectionManager * con) {

     publishOnRadio(data,con);
     
     publishOnMqtt(data, con);

}


void print_communication() {
     Serial.println("from Communication_lib");
  }