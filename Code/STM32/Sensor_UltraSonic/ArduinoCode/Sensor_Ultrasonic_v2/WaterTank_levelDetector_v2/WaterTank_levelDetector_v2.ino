/*
 By hukamtechnologies
 Programm for sensor PCB
 */

#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include <ArduinoJson.h>
#include <LoRa_STM32.h>
#include "STM32LowPower.h"

#define LED_BUILTIN_1 PB15
#define echoPin PB10 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin PB11 //attach pin D3 Arduino to pin Trig of HC-SR04

//#define csPin  PA4          // LoRa radio chip select
//#define resetPin  PC14       // LoRa radio reset
//#define irqPin  PA1  // change for your board; must be a hardware interrupt pin
//#define bat_pin PA1   // to get the current Battery Volts

#define charge_pin PA8
#define NULL 0

boolean charge = false;
String address;
boolean address_set=false;

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
  LoRa.print(outgoing);                 // add payload
  LoRa.endPacket();                     // finish packet and send it
  // msgCount++;                           // increment message ID
}

String getAddress() {
   uint32_t baseAddress = (uint32_t)(0x1ff80050);
   uint32_t baseAddress_2 = (uint32_t)(0x1ff80054);
   uint32_t baseAddress_3 = (uint32_t)(0x1ff8064);
   String address = "";
   address =+ baseAddress;
   address =+ baseAddress_2;
   address =+ baseAddress_3;
   return address; 
}

void setAddress() {
   if (!address_set) {
    address = getAddress();
    address_set = true;
   }
}

// publish the distance (cm)
void measureLevel() {
  float totalDuration;
  for(int i=0;i<11;i++){
     digitalWrite(trigPin, LOW);
     delayMicroseconds(2);
     digitalWrite(trigPin, HIGH); // We send a 10us pulse
     delayMicroseconds(15);
     // delay(1);
     digitalWrite(trigPin, LOW);

     uint32_t duration = pulseIn(echoPin, HIGH, 26000); // We wait for the echo to come back, with a timeout of 20ms, which corresponds approximately to 3m    
  // pulseIn will only return 0 if it timed out. (or if echoPin was already to 1, but it should not happen)
  // If we timed out
     if(duration == 0) {
       pinMode(echoPin, OUTPUT); // Then we set echo pin to output mode
       digitalWrite(echoPin, LOW); // We send a LOW pulse to the echo pin
       delayMicroseconds(200);
       pinMode(echoPin, INPUT); // And finaly we come back to input mode
    
      }
  // float distance = (duration/2) / 29.1; // We calculate the distance (sound speed in air is aprox. 291m/s), /2 because of the pulse going and coming
  totalDuration += (duration/58);
  }
  float distance = totalDuration/10;

  StaticJsonDocument<200> data;
  if(address_set) {
    data["Id"]= address;
  }
  data["level"] = distance;
  String output;
  serializeJson(data, output);
  sendMessage(output);
  
  String *clearing=&output;
  clearing=NULL;
}

void reboot() {
NVIC_SystemReset();
while (1);
}

// the setup function runs once when you press reset or power the board
void setup() {

  // initialize digital pin LED_BUILTIN  as an output.
  pinMode(LED_BUILTIN_1, OUTPUT);
  
  pinMode(echoPin,INPUT_PULLUP);
  pinMode(trigPin, OUTPUT);
  //digitalWrite(ECHOPIN, HIGH);  
  pinMode(charge_pin,OUTPUT); 

  if (!LoRa.begin(433E6)) {             // initialize ratio at 915 MHz
     Serial.println("LoRa init failed. Check your connections.");
    while (true);                       // if failed, do nothing
  }
  setAddress();
  LowPower.begin(); // for Low Power Mode
  digitalWrite(charge_pin, HIGH);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN_1, HIGH);   // turn the LED on (HIGH is the voltage level)
 // digitalWrite(charge_pin, HIGH);
  delay(1000);
  measureLevel();
  digitalWrite(LED_BUILTIN_1, LOW);    // turn the LED off by making the voltage LOW
 // digitalWrite(charge_pin, LOW);
  delay(1000);              // wait for a second
//  LowPower.deepSleep(5000);
//  reboot();
}
