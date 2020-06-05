/* Here ESP32 will keep 2 roles:
1/ read data from DHT11/DHT22 sensor
2/ control led on-off
So it willpublish temperature topic and scribe topic bulb on/off
*/

#include <WiFi.h>
#include <PubSubClient.h>
#include "DHT.h"
#include <ArduinoJson.h>

/** Unique device name */
char apName[] = "ESP-xxxxxxxxxxxx";
String BOARD_ID;

/* change it with your ssid-password */
const char* ssid = "YOUR_WIFI_SSID";
const char* password = "YOUR_WIFI_PASSWORD";
const char* mqtt_server = "iot.eclipse.org";

/* define DHT pins */
#define DHTPIN 2
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

/* create an instance of PubSubClient client */
WiFiClient espClient;
PubSubClient client(espClient);

/* topics */
#define PUB_TOPIC    "smarthome/room1/sensors"
#define SUB_TOPIC    "smarthome/room1/device"

long lastMsg = 0;
char msg[20];
unsigned long interval = 5; // the time we need to wait

void createName() {
	uint8_t baseMac[6];
	// Get MAC address for WiFi station
	esp_read_mac(baseMac, ESP_MAC_WIFI_STA);
	// Write unique name into apName
	sprintf(apName, "ESP-%02X%02X%02X%02X%02X%02X", baseMac[0], baseMac[1], baseMac[2], baseMac[3], baseMac[4], baseMac[5]);
  BOARD_ID = String(apName);
}

void receivedCallback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message received on Topic: ");
  Serial.println(topic);
  StaticJsonBuffer<200> mqttDataBuffer;
  JsonObject& jsonData = mqttDataBuffer.parseObject(payload);
  Serial.print(jsonData["interval"].as<int>());
  interval = jsonData["interval"].as<int>();
  mqttDataBuffer.clear();
}

void mqttconnect() {
  /* Loop until reconnected */
  while (!client.connected()) {
    Serial.print("MQTT connecting ...");
    /* client ID */
    String clientId = "ESP32Client";
    /* connect now */
    if (client.connect(clientId.c_str())) {
      Serial.println("MQTT Connected Successfully");
      /* subscribe topic with default QoS 0*/
      client.subscribe(SUB_TOPIC);
    } else {
      Serial.print("failed, status code =");
      Serial.print(client.state());
      Serial.println("try again in 5 seconds");
      /* Wait 5 seconds before retrying */
      delay(5000);
    }
  }
}

void publishData(String data){
  /* publish the message */
  client.publish(PUB_TOPIC, (char*) data.c_str());
  Serial.print("Published: ");
  Serial.println(data);
}

void setup() {
  delay(500);
  Serial.begin(115200);
  while (!Serial);
  delay(1000);
  createName();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  /* configure the MQTT server with IPaddress and port */
  client.setServer(mqtt_server, 1883);
  /* this receivedCallback function will be invoked
  when client received subscribed topic */
  client.setCallback(receivedCallback);
  /*start DHT sensor */
  dht.begin();
}

void loop() {
  /* if client was disconnected then try to reconnect again */
  if (!client.connected()) {
    mqttconnect();
  }
  /* this function will listen for incomming
  subscribed topic-process-invoke receivedCallback */
  client.loop();

  // we count until interval (in secs) reached to avoid blocking program if using delay()
  long now = millis();
  if (now - lastMsg > (interval * 1000)) {
    lastMsg = now;
    /* read DHT11/DHT22 sensor and convert to string */
    char temperature[8];
    dtostrf((float)dht.readTemperature(),1,2, temperature);
    char humidity[5];
    dtostrf((float)dht.readHumidity(),1,2, humidity);

    String payload;
    StaticJsonBuffer<200> dataJsonBuffer;
    JsonObject& jsonOut = dataJsonBuffer.createObject();
    jsonOut["uniqueId"] = BOARD_ID;
    jsonOut["temp"] = String(temperature);
    jsonOut["humidity"] = String(humidity);
    // Convert JSON object into a string
    jsonOut.printTo(payload);
    publishData(payload);
    dataJsonBuffer.clear();

    // String val = "{temp:" +String(temperature)+", hum:"+String(humidity)+"}";

  }
}
