// Default Arduino includes
#include <Arduino.h>
#include <WiFi.h>
#include <nvs.h>
#include <nvs_flash.h>
#include <ArduinoJson.h>

// for Energy Monitoring
#include <ACS712.h>
// branch
#include <stdlib.h>
#include <SPI.h>
#include <LoRa.h>
#include <PubSubClient.h>

// Includes for BLE
#include <BLEUtils.h>
#include <BLEServer.h>
#include <BLEDevice.h>
#include <BLEAdvertising.h>
#include <BLE2902.h>
#include <Preferences.h>

#define BAND    433E6
#define SCK     5
#define MISO    19
#define MOSI    27
#define CS      18

#define SS      18
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

int hallData = 0;
int boardTemp = 0;

static int taskCore = 0;
bool radioAvailable = false;
bool enableRadio = true;
bool enableBLE = true;
bool enableWiFi = true;
bool enableMQTT = false;

unsigned long interval = 5; // the time we need to wait
unsigned long previousMillis = 0;
unsigned long previousTouchMillis = 0;

/** Build time */
const char compileDate[] = __DATE__ " " __TIME__;

/** Unique device name */
char apName[] = "SB_MICRO-xxxxxxxxxxxx";

// #define HEARTBEAT_LED  32
#define HEARTBEAT_LED  25
#define WIFI_LED  32
#define BLE_LED  33
#define touch1 4 // Pin for capactitive touch sensor
#define touch2 2 // Pin for capactitive touch sensor
#define touch3 13 // Pin for capactitive touch sensor
#define touch4 15 // Pin for capactitive touch sensor

bool hbLedState = LOW; // Heartbeat LED state

ACS712 sensor(ACS712_30A, 34);
char watt[5];

unsigned long last_time =0;
unsigned long current_time =0;
float Wh =0 ;

int SW1 = 17;
int SW2 = 16;
int SW3 = 22;
int SW4 = 23;

int sw1Val = 1;
int sw2Val = 1;
int sw3Val = 1;
int sw4Val = 1;

boolean lastState1 = LOW;
boolean lastState2 = LOW;
boolean lastState3 = LOW;
boolean lastState4 = LOW;

bool usePrimAP = true; // use primary or secondary WiFi network
/** Connection status */
volatile bool wifiConnected = false;
volatile bool mqttConnected = false;
/** Connection change status */
bool connStatusChanged = false;

// IOT PLATFORM VARIABLES
#define ORG "rqeofj"
#define BOARD_TYPE "SB_MICRO"
#define TOKEN "1SatnamW"
#define PUBSUB_PREFIX "iot-2/type/SB_MICRO/id/"

char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
// char server[] = "mqtt.flespi.io";
// iot-2/type/device_type/id/device_id/evt/event_id/fmt/json
String pub_topic = "iot-2/evt/cloud/fmt/json";
String sub_topic = "iot-2/cmd/device/fmt/json";
// String pub_topic = "evt/sb_micro/cloud/";
// String sub_topic = "evt/sb_micro/board/";
char mqttUser[] = "use-token-auth";
char mqttPassword[] = "1SatnamW"; // Auth token of Device registered on Watson IoT Platform
// char mqttUser[] = "IdawJwQIHs0LuzfZKYWvXFwUeV0bbiAJlA3TUJpp0fYkE39cPTyAmUkqD9pFfPcp";
// char mqttPassword[] = "";

String BOARD_ID;
WiFiClient wifiClient;
// PubSubClient client(server, 1883, NULL, wifiClient);
PubSubClient client(wifiClient);

// List of Service and Characteristic UUIDs
#define SERVICE_UUID  "430cbe63-a0bf-4090-819a-0355f4ca2c68"
#define WIFI_UUID     "9bdfa7ea-fa8c-4cde-94d7-66a03d984ebd"
#define NOTIFICATION_UUID   0x2A08
#define STATUS_UUID         0x2A3D

/** SSIDs of local WiFi networks */
String ssidPrim;
String ssidSec;
/** Password for local WiFi network */
String pwPrim;
String pwSec;

BLECharacteristic *pCharacteristicWiFi;
BLECharacteristic *pCharacteristicNotify;
BLECharacteristic *pCharacteristicStatus;

BLEUUID pNotifUUID;

/** BLE Advertiser */
BLEAdvertising* pAdvertising;
/** BLE Service */
BLEService *pService;
/** BLE Server */
BLEServer *pServer;

bool bleConnected = false;
String bleStatus;

/** Buffer for JSON string */
// MAx size is 51 bytes for frame:
// {"ssidPrim":"","pwPrim":"","ssidSec":"","pwSec":""}
// + 4 x 32 bytes for 2 SSID's and 2 passwords
// StaticJsonBuffer<200> jsonBuffer;

char* string2char(String str){
    if(str.length()!=0){
        char *p = const_cast<char*>(str.c_str());
        return p;
    }
}

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
          digitalWrite(SW1, deviceAction);
          sw1Val = deviceAction;
        break;
      case 2:
          digitalWrite(SW2, deviceAction);
          sw2Val = deviceAction;
        break;
      case 3:
          digitalWrite(SW3, deviceAction);
          sw3Val = deviceAction;
        break;
      case 4:
          digitalWrite(SW4, deviceAction);
          sw4Val = deviceAction;
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

/**
 * Connect to MQTT Server
 */
static void connectMQTT() {
  if(wifiConnected && !mqttConnected) {
    if(BOARD_ID == ""){
      BOARD_ID = String(apName);
    }
     String clientId = "d:" ORG ":" BOARD_TYPE ":" +BOARD_ID;
     // String clientId = BOARD_ID;
     Serial.print("Connecting MQTT client: ");
     Serial.println(clientId);
     // mqttConnected = client.connect((char*) clientId.c_str(), token, "");
     mqttConnected = client.connect((char*) clientId.c_str(), mqttUser, mqttPassword);
     if(mqttConnected){
       client.subscribe(sub_topic.c_str());
       Serial.print("Subscribed to : >>  ");
       Serial.println(sub_topic);
     }
     Serial.print("MQTT Status: >>> ");
     Serial.print(client.state());
     // Serial.println(mqttConnected);
  }else{
    Serial.println("Cannot connect to MQTT as WiFi is not Connected !!");
  }
}

/**
 * MyServerCallbacks
 * Callbacks for client connection and disconnection
 */
class MyServerCallbacks: public BLEServerCallbacks {
	// TODO this doesn't take into account several clients being connected
	void onConnect(BLEServer* pServer) {
		Serial.println("BLE client connected: >> ");
    bleConnected = true;
    BLEDevice::startAdvertising();
    // pAdvertising->start();
    digitalWrite(BLE_LED, 1);
	};

	void onDisconnect(BLEServer* pServer) {
		Serial.println("BLE client disconnected");
    bleConnected = false;
    BLEDevice::startAdvertising();
		// pAdvertising->start();
    digitalWrite(BLE_LED, 0);
	}
};

/**
 * MyCallbackHandler
 * Callbacks for BLE client read/write requests
 */
class MyCallbackHandler: public BLECharacteristicCallbacks {
	void onWrite(BLECharacteristic *pCharacteristic) {
		std::string value = pCharacteristic->getValue();
		if (value.length() == 0) {
			return;
		}
		String data = String((char *)&value[0]);
    Serial.println("Received over BLE: " + data);
    // char * data2 = const_cast<char*>((char *)&value[0]);
    // Serial.println("Data: >> " +data2.c_str());
		// Decode data
		int keyIndex = 0;
		for (int index = 0; index < value.length(); index ++) {
			value[index] = (char) value[index] ^ (char) apName[keyIndex];
			keyIndex++;
			if (keyIndex >= strlen(apName)) keyIndex = 0;
		}

		/** Json object for incoming data */
    // DynamicJsonBuffer dynamicJsonBuffer
    StaticJsonBuffer<200> bleJsonBuffer;
		JsonObject& jsonIn = bleJsonBuffer.parseObject(data);
		if (jsonIn.success()) {
			if (jsonIn.containsKey("ssidPrim") &&
					jsonIn.containsKey("pwPrim") &&
					jsonIn.containsKey("ssidSec") &&
					jsonIn.containsKey("pwSec")) {
				ssidPrim = jsonIn["ssidPrim"].as<String>();
				pwPrim = jsonIn["pwPrim"].as<String>();
				ssidSec = jsonIn["ssidSec"].as<String>();
				pwSec = jsonIn["pwSec"].as<String>();

				Preferences preferences;
				preferences.begin("WiFiCred", false);
				preferences.putString("ssidPrim", ssidPrim);
				preferences.putString("ssidSec", ssidSec);
				preferences.putString("pwPrim", pwPrim);
				preferences.putString("pwSec", pwSec);
				preferences.putBool("hasWifi", true);
				preferences.end();

				Serial.println("Received over bluetooth:");
				Serial.println("primary SSID: "+ssidPrim+" password: "+pwPrim);
				Serial.println("secondary SSID: "+ssidSec+" password: "+pwSec);
				connStatusChanged = true;
			} else if (jsonIn.containsKey("erase")) {
				Serial.println("Received erase command");
				Preferences preferences;
				preferences.begin("WiFiCred", false);
				preferences.clear();
				preferences.end();
				connStatusChanged = true;
				ssidPrim = "";
				pwPrim = "";
				ssidSec = "";
				pwSec = "";

				int err;
				err=nvs_flash_init();
				Serial.println("nvs_flash_init: " + err);
				err=nvs_flash_erase();
				Serial.println("nvs_flash_erase: " + err);
			} else if (jsonIn.containsKey("reset")) {
				WiFi.disconnect();
				esp_restart();
			}
		} else {
			Serial.println("Received invalid JSON");
		}
		bleJsonBuffer.clear();
	};

	void onRead(BLECharacteristic *pCharacteristic) {
		Serial.println("BLE onRead request");
    if (pCharacteristic == pCharacteristicNotify) {
      uint8_t notifData[8];
      time_t now;
      struct tm timeinfo;
      time(&now); // get time (as epoch)
      localtime_r(&now, &timeinfo); // update tm struct with current time
      uint16_t year = timeinfo.tm_year+1900;
      notifData[1] = year>>8;
      notifData[0] = year;
      notifData[2] = timeinfo.tm_mon+1;
      notifData[3] = timeinfo.tm_mday;
      notifData[4] = timeinfo.tm_hour;
      notifData[5] = timeinfo.tm_min;
      notifData[6] = timeinfo.tm_sec;
      pCharacteristic->setValue(notifData, 8);
    }else if (pCharacteristic == pCharacteristicWiFi) {
      String wifiCredentials;
      /** Json object for outgoing data */
      StaticJsonBuffer<200> wifiJsonBuffer;
      JsonObject& jsonOut = wifiJsonBuffer.createObject();
      jsonOut["ssidPrim"] = ssidPrim;
      jsonOut["pwPrim"] = pwPrim;
      jsonOut["ssidSec"] = ssidSec;
      jsonOut["pwSec"] = pwSec;
      // Convert JSON object into a string
      jsonOut.printTo(wifiCredentials);

      // encode the data
      int keyIndex = 0;
      Serial.println("Stored settings: " + wifiCredentials);
      for (int index = 0; index < wifiCredentials.length(); index ++) {
        wifiCredentials[index] = (char) wifiCredentials[index] ^ (char) apName[keyIndex];
        keyIndex++;
        if (keyIndex >= strlen(apName)) keyIndex = 0;
      }
      pCharacteristicWiFi->setValue((uint8_t*)&wifiCredentials[0],wifiCredentials.length());
      wifiJsonBuffer.clear();
    }else if (pCharacteristic == pCharacteristicStatus) {
      size_t dataLen = bleStatus.length();
      uint8_t bleData[dataLen+1];
      bleStatus.toCharArray((char *)bleData,dataLen+1);
      pCharacteristic->setValue(bleData, dataLen);
    }
	}
};

/**
 * initBLE
 * Initialize BLE service and characteristic
 * Start BLE server and service advertising
 */
void initBLE() {
  if(enableBLE){
    // Initialize BLE and set output power
    BLEDevice::init(apName);
    BLEDevice::setPower(ESP_PWR_LVL_P7);

    // Create BLE Server
    pServer = BLEDevice::createServer();

    // Set server callbacks
    pServer->setCallbacks(new MyServerCallbacks());

    // Create BLE Service
    pService = pServer->createService(BLEUUID(SERVICE_UUID),20);

    // Create BLE Characteristic for Alert
    pCharacteristicNotify = pService->createCharacteristic(
                        BLEUUID((uint16_t)NOTIFICATION_UUID),
                        BLECharacteristic::PROPERTY_READ   |
                        BLECharacteristic::PROPERTY_NOTIFY |
                        BLECharacteristic::PROPERTY_INDICATE
                      );

    // Create a BLE Descriptor for Alert
    pCharacteristicNotify->addDescriptor(new BLE2902());

    // Create BLE Characteristic for WiFi settings
    pCharacteristicWiFi = pService->createCharacteristic(
      BLEUUID(WIFI_UUID),
      // WIFI_UUID,
      BLECharacteristic::PROPERTY_READ |
      BLECharacteristic::PROPERTY_WRITE
    );

    // Create BLE Characteristic for Status
    pCharacteristicStatus = pService->createCharacteristic(
                        BLEUUID((uint16_t)STATUS_UUID),
                        BLECharacteristic::PROPERTY_READ
                      );

    pCharacteristicNotify->setCallbacks(new MyCallbackHandler());
    pCharacteristicWiFi->setCallbacks(new MyCallbackHandler());
    pCharacteristicStatus->setCallbacks(new MyCallbackHandler());

    // Start the service
    pService->start();

    // Start advertising
    pAdvertising = BLEDevice::getAdvertising();
    pAdvertising->addServiceUUID(SERVICE_UUID);
    pAdvertising->setScanResponse(false);
    pAdvertising->setMinPreferred(0x0);  // set value to 0x00 to not advertise this parameter
    BLEDevice::startAdvertising();
  }
}

/** Callback for receiving IP address from AP */
void gotIP(system_event_id_t event) {
	wifiConnected = true;
	connStatusChanged = true;
  digitalWrite(WIFI_LED, 1);
  digitalWrite(HEARTBEAT_LED, 0);
}

/** Callback for connection loss */
void lostCon(system_event_id_t event) {
	wifiConnected = false;
	connStatusChanged = true;
  digitalWrite(WIFI_LED, 0);
  digitalWrite(HEARTBEAT_LED, 1);
}

/**
	 scanWiFi
	 Scans for available networks
	 and decides if a switch between
	 allowed networks makes sense

	 @return <code>bool</code>
	        True if at least one allowed network was found
*/
bool scanWiFi() {
	/** RSSI for primary network */
	int8_t rssiPrim;
	/** RSSI for secondary network */
	int8_t rssiSec;
	/** Result of this function */
	bool result = false;

	Serial.println("Start scanning for networks");

	WiFi.disconnect(true);
	WiFi.enableSTA(true);
	WiFi.mode(WIFI_STA);

	// Scan for AP
	int apNum = WiFi.scanNetworks(false,true,false,1000);
	if (apNum == 0) {
		Serial.println("Found no networks?????");
		return false;
	}

	byte foundAP = 0;
	bool foundPrim = false;

	for (int index=0; index<apNum; index++) {
		String ssid = WiFi.SSID(index);
		Serial.println("Found AP: " + ssid + " RSSI: " + WiFi.RSSI(index));
		if (!strcmp((const char*) &ssid[0], (const char*) &ssidPrim[0])) {
			Serial.println("Found primary AP");
			foundAP++;
			foundPrim = true;
			rssiPrim = WiFi.RSSI(index);
		}
		if (!strcmp((const char*) &ssid[0], (const char*) &ssidSec[0])) {
			Serial.println("Found secondary AP");
			foundAP++;
			rssiSec = WiFi.RSSI(index);
		}
	}

	switch (foundAP) {
		case 0:
			result = false;
			break;
		case 1:
			if (foundPrim) {
				usePrimAP = true;
			} else {
				usePrimAP = false;
			}
			result = true;
			break;
		default:
			Serial.printf("RSSI Prim: %d Sec: %d\n", rssiPrim, rssiSec);
			if (rssiPrim > rssiSec) {
				usePrimAP = true; // RSSI of primary network is better
			} else {
				usePrimAP = false; // RSSI of secondary network is better
			}
			result = true;
			break;
	}
	return result;
}

/**
 * Start connection to AP
 */
void connectWiFi() {
	// Setup callback function for successful connection
	WiFi.onEvent(gotIP, SYSTEM_EVENT_STA_GOT_IP);
	// Setup callback function for lost connection
	WiFi.onEvent(lostCon, SYSTEM_EVENT_STA_DISCONNECTED);

	WiFi.disconnect(true);
	WiFi.enableSTA(true);
	WiFi.mode(WIFI_STA);

	Serial.println();
	Serial.print("Start connection to ");
  ssidPrim = "hukam";
  pwPrim = "1SatnamW";
	if (usePrimAP && ssidPrim && !ssidPrim.equals("")) {
		Serial.println(ssidPrim);
		WiFi.begin(ssidPrim.c_str(), pwPrim.c_str());
	} else {
		Serial.println(ssidSec);
		WiFi.begin(ssidSec.c_str(), pwSec.c_str());
	}
}

void initSwitches(){
  Preferences preferences;
  preferences.begin("SwitchesState", false);
  bool hasPref = preferences.getBool("valid", false);
  if (hasPref) {
		sw1Val = preferences.getInt("sw1Val", 1);
    sw2Val = preferences.getInt("sw2Val", 1);
    sw3Val = preferences.getInt("sw3Val", 1);
    sw4Val = preferences.getInt("sw4Val", 1);
  }else{
    preferences.putInt("sw1Val", 1);
    preferences.putInt("sw2Val", 1);
    preferences.putInt("sw3Val", 1);
    preferences.putInt("sw4Val", 1);
    preferences.putBool("valid", true);
  }
  preferences.end();

  digitalWrite (SW1, sw1Val);
  digitalWrite (SW2, sw2Val);
  digitalWrite (SW3, sw3Val);
  digitalWrite (SW4, sw4Val);
    // Serial.printf("Switch 1: %d, Switch 2: %d, Switch 3: %d, Switch 4: %d\n\n", sw1Val, sw2Val, sw3Val, sw4Val);

}

void setupConfiguration(){
	Preferences preferences;
	preferences.begin("WiFiCred", false);
	bool hasWifi = preferences.getBool("hasWifi", false);
	if (hasWifi) {
		ssidPrim = preferences.getString("ssidPrim","");
		ssidSec = preferences.getString("ssidSec","");
		pwPrim = preferences.getString("pwPrim","");
		pwSec = preferences.getString("pwSec","");

		if (ssidPrim.equals("")
				|| pwPrim.equals("")
				|| ssidSec.equals("")
				|| pwPrim.equals("")) {
			Serial.println("Found preferences but credentials are invalid");
      ssidSec = "hukam";
      pwSec = "1SatnamW";
		} else {
			Serial.println("Read from preferences:");
			Serial.println("primary SSID: "+ssidPrim+" password: "+pwPrim);
			Serial.println("secondary SSID: "+ssidSec+" password: "+pwSec);
		}
	} else {
		Serial.println("Could not find preferences, need send data over BLE");
    ssidSec = "hukam";
    pwSec = "1SatnamW";
	}
	preferences.end();
}

void initWiFi(){
    if (enableWiFi) {
      client.setServer(server, 1883);
      client.setCallback(mqttCallback);
      // Check for available AP's
      if (!scanWiFi) {
        Serial.println("Could not find any AP");
      } else {
        // If AP was found, start connection
        connectWiFi();
      }
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
   if (wifiConnected) {
     if(client.publish(pub_topic.c_str(), (char*) data.c_str())){
       Serial.print("Published payload to Topic[");
       Serial.print(pub_topic);
       Serial.print("]: ");
       Serial.println(data);
       published = true;
     }else{
       Serial.println("Publish failed: ");
       if (!!!client.connected()) {
         if(enableMQTT) {
           connectMQTT();
         }
       }
       // Serial.println(data);
     }
  }

    if(radioAvailable && !published){
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

void updateSwStateAndPublish(String varName, int index, int swValue){
  Preferences preferences;
  preferences.begin("SwitchesState", false);
  preferences.putInt(string2char(varName), swValue);
  preferences.end();
  // String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":1, \"deviceValue\": " +String(sw1Val)+"}";
  String payload;
  StaticJsonBuffer<200> dataJsonBuffer;
  JsonObject& jsonOut = dataJsonBuffer.createObject();
  jsonOut["type"] = BOARD_TYPE;
  jsonOut["uniqueId"] = BOARD_ID;
  jsonOut["deviceIndex"] = index;
  jsonOut["deviceValue"] = swValue;
  // Convert JSON object into a string
  jsonOut.printTo(payload);
  publishData(payload);
  dataJsonBuffer.clear();
}

void checkTouchDetected(){
  if(digitalRead(touch1) == HIGH){
        Serial.println("1 pressed");
        if (sw1Val == 0){
          digitalWrite(SW1, 1);
          sw1Val = 1;
        } else {
          digitalWrite(SW1, 0);
          sw1Val = 0;
        }
        updateSwStateAndPublish("sw1Val", 1, sw1Val);
        delay(500);
  }
  if(digitalRead(touch2) == HIGH){
    Serial.println("2 pressed");
    if (sw2Val == 0){
      digitalWrite(SW2, 1);
      sw2Val = 1;
    } else {
      digitalWrite(SW2, 0);
      sw2Val = 0;
    }
    updateSwStateAndPublish("sw2Val", 2, sw2Val);
    delay(500);
  }
  if(digitalRead(touch3) == HIGH){
    Serial.println("3 pressed");
    if (sw3Val == 0){
      digitalWrite(SW3, 1);
      sw3Val = 1;
    } else {
      digitalWrite(SW3, 0);
      sw3Val = 0;
    }
    updateSwStateAndPublish("sw3Val", 3, sw3Val);
    delay(500);
  }
  if(digitalRead(touch4) == HIGH){
    Serial.println("4 pressed");
    if (sw4Val == 0){
      digitalWrite(SW4, 1);
      sw4Val = 1;
    } else {
      digitalWrite(SW4, 0);
      sw4Val = 0;
    }
    updateSwStateAndPublish("sw4Val", 4, sw4Val);
    delay(500);
  }
}

void initDevice(){
	// Create unique device name
	createName();
  initRadio();
  initSwitches();
	setupConfiguration();
	initBLE();
	initWiFi();
}


/**
 * Device Setup
 */
void setup() {
  delay(500);
	// Send some device info
	Serial.print("Build: ");
	Serial.println(compileDate);

  pinMode(HEARTBEAT_LED, OUTPUT);
  pinMode(WIFI_LED, OUTPUT);
  pinMode(BLE_LED, OUTPUT);
  pinMode(SW1, OUTPUT);
  pinMode(SW2, OUTPUT);
  pinMode(SW3, OUTPUT);
  pinMode(SW4, OUTPUT);

  digitalWrite(SW1, 1);
  digitalWrite(SW2, 1);
  digitalWrite(SW3, 1);
  digitalWrite(SW4, 1);

  pinMode(touch1, INPUT);
  pinMode(touch2, INPUT);
  pinMode(touch3, INPUT);
  pinMode(touch4, INPUT);

  sensor.calibrate();

  // Init Lora
  if(enableRadio){
      SPI.begin(SCK, MISO, MOSI, CS);
      LoRa.setPins(SS, RST, DI0);
      delay(1000);
  }

  Serial.begin(115200);
  while (!Serial);
  delay(1000);

	initDevice();
  /*

  void loop() {

  }

  */

}

/**
 * Logic that runs in Loop
 */
 void getCurrent() {
   float V = 230;
   float I = sensor.getCurrentAC();
 // Serial.println(I);
   float P = V * I;
   last_time = current_time;
   current_time = millis();
   Wh = Wh+  P *(( current_time -last_time) /3600000.0) ;
    dtostrf(Wh, 4, 2, watt);
   Serial.print("Energy: ");
   Serial.print(watt);
   Serial.println();
   delay(500);
 }

void loop() {
	if (connStatusChanged) {
		if (wifiConnected) {
			Serial.print("Connected to AP: ");
			Serial.print(WiFi.SSID());
			Serial.print(" with IP: ");
			Serial.print(WiFi.localIP());
			Serial.print(" RSSI: ");
			Serial.println(WiFi.RSSI());
      if (!!!client.connected()) {
        if(enableMQTT) {
           connectMQTT();
        }
      }
		} else {
				Serial.println("Lost WiFi connection");
				// Received WiFi credentials
				if (!scanWiFi) { // Check for available AP's
					Serial.println("Could not find any AP");
				} else { // If AP was found, start connection
					connectWiFi();
				}
		}
		connStatusChanged = false;
	}

  unsigned long currentMillis = millis();
    checkDataOnRadio();
    checkTouchDetected();
    client.loop();
    if ((unsigned long)(currentMillis - previousMillis) >= (interval * 1000)) {
      // if(!wifiConnected){
      //   if(hbLedState == HIGH){
      //     digitalWrite(HEARTBEAT_LED, 0);
      //     hbLedState = LOW;
      //   }
      // }else{
      //   if(hbLedState == LOW){
      //     digitalWrite(HEARTBEAT_LED, 1);
      //     hbLedState = HIGH;
      //   }
      // }
      if (wifiConnected && enableMQTT && (!!!client.connected() || !client.loop())) {
        if(enableMQTT) {
          Serial.println("MQTT Connection Lost, RECONNECTING AGAIN.......");
          mqttConnected = false;
          connectMQTT();
        }
      }
      previousMillis =  millis();
    }
  getCurrent();
}
