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
bool enableWiFi = true;

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

int SW1 = 17;
int SW2 = 16;
int SW3 = 12;
int SW4 = 23;

int sw1Val = 0;
int sw2Val = 0;
int sw3Val = 0;
int sw4Val = 0;

boolean lastState1 = LOW;
boolean lastState2 = LOW;
boolean lastState3 = LOW;
boolean lastState4 = LOW;

bool usePrimAP = true; // use primary or secondary WiFi network
/** Flag if stored AP credentials are available */
bool hasCredentials = false;
/** Connection status */
volatile bool isConnected = false;
/** Connection change status */
bool connStatusChanged = false;

// IOT PLATFORM VARIABLES
#define ORG "rqeofj"
#define BOARD_TYPE "SB_MICRO"
#define TOKEN "1SatnamW"

char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/sb_micro/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = "1SatnamW"; // Auth token of Device registered on Watson IoT Platform

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
StaticJsonBuffer<200> jsonBuffer;

char* string2char(String str){
    if(str.length()!=0){
        char *p = const_cast<char*>(str.c_str());
        return p;
    }
}

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
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
}

/**
 * Connect to MQTT Server
 */
static void connectMQTT() {
  if(isConnected){
    Serial.print("IN connecting MQTT client...");
    if(BOARD_ID == ""){
      // char chipid[20];
      // sprintf(chipid, "%" PRIu64, ESP.getEfuseMac());
      // BOARD_ID = "HB_"+String(chipid);
      BOARD_ID = String(apName);
    }
     String clientId = "d:" ORG ":" BOARD_TYPE ":" +BOARD_ID;
     Serial.print("Connecting MQTT client: ");
     Serial.println(clientId);
     int mqttTryCount = 0;
     bool mqttConnected = false;
     do{
       mqttConnected = client.connect((char*) clientId.c_str(), authMethod, token);
       mqttTryCount++;
       if(!mqttConnected){
         Serial.printf("Connecting MQTT failed to clientId: %s, Try Count: %d\n", clientId, mqttTryCount);
         delay(2000);
       }else{
         Serial.print("MQTT Connected Successfully...");
       }
     }while(!mqttConnected && mqttTryCount < 3);

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
		JsonObject& jsonIn = jsonBuffer.parseObject(data);
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
				preferences.putBool("valid", true);
				preferences.end();

				Serial.println("Received over bluetooth:");
				Serial.println("primary SSID: "+ssidPrim+" password: "+pwPrim);
				Serial.println("secondary SSID: "+ssidSec+" password: "+pwSec);
				connStatusChanged = true;
				hasCredentials = true;
			} else if (jsonIn.containsKey("erase")) {
				Serial.println("Received erase command");
				Preferences preferences;
				preferences.begin("WiFiCred", false);
				preferences.clear();
				preferences.end();
				connStatusChanged = true;
				hasCredentials = false;
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
		jsonBuffer.clear();
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
      JsonObject& jsonOut = jsonBuffer.createObject();
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
      jsonBuffer.clear();
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

/** Callback for receiving IP address from AP */
void gotIP(system_event_id_t event) {
	isConnected = true;
	connStatusChanged = true;
  digitalWrite(WIFI_LED, 1);
  if (!!!client.connected()) {
    connectMQTT();
  }
}

/** Callback for connection loss */
void lostCon(system_event_id_t event) {
	isConnected = false;
	connStatusChanged = true;
  digitalWrite(WIFI_LED, 0);
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
	if (usePrimAP) {
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
		sw1Val = preferences.getInt("sw1Val", 0);
    sw2Val = preferences.getInt("sw2Val", 0);
    sw3Val = preferences.getInt("sw3Val", 0);
    sw4Val = preferences.getInt("sw4Val", 0);
  }else{
    preferences.putInt("sw1Val", 0);
    preferences.putInt("sw2Val", 0);
    preferences.putInt("sw3Val", 0);
    preferences.putInt("sw4Val", 0);
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
	bool hasPref = preferences.getBool("valid", false);
	if (hasPref) {
		ssidPrim = preferences.getString("ssidPrim","");
		ssidSec = preferences.getString("ssidSec","");
		pwPrim = preferences.getString("pwPrim","");
		pwSec = preferences.getString("pwSec","");

		if (ssidPrim.equals("")
				|| pwPrim.equals("")
				|| ssidSec.equals("")
				|| pwPrim.equals("")) {
			Serial.println("Found preferences but credentials are invalid");
		} else {
			Serial.println("Read from preferences:");
			Serial.println("primary SSID: "+ssidPrim+" password: "+pwPrim);
			Serial.println("secondary SSID: "+ssidSec+" password: "+pwSec);
			hasCredentials = true;
		}
	} else {
		Serial.println("Could not find preferences, need send data over BLE");
	}
	preferences.end();
}

void initWiFi(){
    if (hasCredentials && enableWiFi) {
      client.setServer(server, 1883);
      client.setCallback(callback);
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
   if (isConnected) {
     if(client.publish(topic, (char*) data.c_str())){
       Serial.print("Published payload: ");
       Serial.println(data);
       published = true;
     }else{
       Serial.println("Publish failed: ");
       if (!!!client.connected()) {
         connectMQTT();
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
  JsonObject& jsonOut = jsonBuffer.createObject();
  jsonOut["type"] = BOARD_TYPE;
  jsonOut["uniqueId"] = BOARD_ID;
  jsonOut["deviceIndex"] = index;
  jsonOut["deviceValue"] = swValue;
  // Convert JSON object into a string
  jsonOut.printTo(payload);
  publishData(payload);
  jsonBuffer.clear();
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

  pinMode(touch1, INPUT);
  pinMode(touch2, INPUT);
  pinMode(touch3, INPUT);
  pinMode(touch4, INPUT);

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

}

/**
 * Logic that runs in Loop
 */
void loop() {
	if (connStatusChanged) {
		if (isConnected) {
			Serial.print("Connected to AP: ");
			Serial.print(WiFi.SSID());
			Serial.print(" with IP: ");
			Serial.print(WiFi.localIP());
			Serial.print(" RSSI: ");
			Serial.println(WiFi.RSSI());
		} else {
			if (hasCredentials) {
				Serial.println("Lost WiFi connection");
				// Received WiFi credentials
				if (!scanWiFi) { // Check for available AP's
					Serial.println("Could not find any AP");
				} else { // If AP was found, start connection
					connectWiFi();
				}
			}
		}
		connStatusChanged = false;
	}

  if (isConnected && (!!!client.connected() || !client.loop())) {
    Serial.println("MQTT Connection Lost, RECONNECTING AGAIN.......");
    connectMQTT();
  }

  unsigned long currentMillis = millis();
    checkDataOnRadio();
    checkTouchDetected();
    if ((unsigned long)(currentMillis - previousMillis) >= (interval * 1000)) {
         if(hbLedState == LOW){
             digitalWrite(HEARTBEAT_LED, 1);
             hbLedState = HIGH;
         }else{
             digitalWrite(HEARTBEAT_LED, 0);
             hbLedState = LOW;
         }
         previousMillis =  millis();
    }

}
