
/*
 By hukamtechnologies
 Programm for sensor PCB
 */

#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>
#include <ArduinoJson.h>
#include <LoRa_STM32.h>


#define LED_BUILTIN_1 PB15
#define echoPin PB10 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin PB11 //attach pin D3 Arduino to pin Trig of HC-SR04
#define light_sensor PB0

//#define csPin  PA4          // LoRa radio chip select
//#define resetPin  PC14       // LoRa radio reset
//#define irqPin  PA1  // change for your board; must be a hardware interrupt pin
#define bat_pin PA1   // to get the current Battery Volts
#define charge_pin PB14

boolean charge = false;

TwoWire Wire1(PB9,PB8);
Adafruit_BME280 bme;

String outgoing;  // outgoing message
boolean status=false;

byte msgCount = 0;            // count of outgoing messages
byte localAddress = 0xBB;     // address of this device
byte destination = 0xFF;      // destination to send to
long lastSendTime = 0;        // last send time
int interval = 1000;          // interval between sends

void sleep(int n) {
  while(n-- > 0)
    asm("wfi");
}
void sendMessage(String outgoing) {
  LoRa.beginPacket();                   // start packet
  // LoRa.write(destination);              // add destination address
  // LoRa.write(localAddress);             // add sender address
  // LoRa.write(msgCount);                 // add message ID
  // LoRa.write(outgoing.length());        // add payload length
  LoRa.print(outgoing);                 // add payload
  LoRa.endPacket();                     // finish packet and send it
  // msgCount++;                           // increment message ID
}



// returns the distance (cm)
void measureDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH); // We send a 10us pulse
  delayMicroseconds(10);
  // delay(1);
  digitalWrite(trigPin, LOW);

  uint32_t duration = pulseIn(echoPin, HIGH, 25000); // We wait for the echo to come back, with a timeout of 20ms, which corresponds approximately to 3m
  // long duration = pulseIn(echoPin, HIGH);

  // pulseIn will only return 0 if it timed out. (or if echoPin was already to 1, but it should not happen)
  // If we timed out
  if(duration == 0) {
    pinMode(echoPin, OUTPUT); // Then we set echo pin to output mode
    digitalWrite(echoPin, LOW); // We send a LOW pulse to the echo pin
    delayMicroseconds(200);
    pinMode(echoPin, INPUT); // And finaly we come back to input mode
  }

  // float distance = (duration/2) / 29.1; // We calculate the distance (sound speed in air is aprox. 291m/s), /2 because of the pulse going and coming
  float distance = duration * 0.034 / 2;
  // float distance = duration / 58.138f;

  // String payload = "{\"type\":\"" BOARD_TYPE "\", \"uniqueId\":\"" +BOARD_ID+"\", \"deviceIndex\":1, \"deviceValue\": " +String(sw1Val)+"}";
  String payload;
  StaticJsonDocument<200> data;
//  JsonObject& jsonOut = dataJsonBuffer.createObject();
  
  data["distance"] = distance;
  data["light"]=analogRead(light_sensor);
  data["Temp"]= (bme.readTemperature(),1);
  String output;
  serializeJson(data, output);
  sendMessage(output);
}

void checkBattery() {
   StaticJsonDocument<200> bat_status;
   //float inputVoltage = (float(analogRead(bat_pin))/4096) * 3.3;
   bat_status["battery_status"]=analogRead(bat_pin);
   String output=" V";
   serializeJson(bat_status,output);
   sendMessage(output);  
   
}

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN  as an output.
  pinMode(LED_BUILTIN_1, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT
  pinMode(light_sensor,INPUT);
  pinMode(charge_pin,OUTPUT);
  pinMode(bat_pin,INPUT);
  analogWrite(bat_pin,0);
  
  Wire1.begin();
  Wire1.setClock(400000);

 // LoRa.setPins(csPin, resetPin, irqPin);// set CS, reset, IRQ pin
 
  if (!LoRa.begin(433E6)) {             // initialize ratio at 915 MHz
     Serial.println("LoRa init failed. Check your connections.");
    while (true);                       // if failed, do nothing
  }
// Initiate Temperature Sensor

  bme.begin(0x76);   
//  digitalWrite(charge_pin,HIGH);

}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN_1, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);
  checkBattery();
  measureDistance();
  digitalWrite(LED_BUILTIN_1, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);              // wait for a second
}
