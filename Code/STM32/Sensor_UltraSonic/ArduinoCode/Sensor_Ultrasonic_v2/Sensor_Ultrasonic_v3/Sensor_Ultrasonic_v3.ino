
/*
 By hukamtechnologies
 Programm for sensor PCB
 */

#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>
#include <SFE_BMP180.h>
#include <ArduinoJson.h>
#include <LoRa_STM32.h>
#include "STM32LowPower.h"

#define LED_BUILTIN_1 PB15
#define echoPin PB10 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin PB11 //attach pin D3 Arduino to pin Trig of HC-SR04
#define light_sensor PB0

//#define csPin  PA4          // LoRa radio chip select
//#define resetPin  PC14       // LoRa radio reset
//#define irqPin  PA1  // change for your board; must be a hardware interrupt pin
//#define bat_pin PA1   // to get the current Battery Volts
#define sensor_pin PA8
#define NULL 0

boolean charge = false;
String address;
boolean address_set=false;

//TwoWire Wire1(PB7,PB6);
Adafruit_BME280 bme;
SFE_BMP180 bmp180;

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

float measureTemp() {
//   float T = (bme.readTemperature());
//   return T;

  char status;
  double T; //Creating variables for temp
  

  status = bmp180.startTemperature();
  if (status != 0) {
    delay(status);
//
    status = bmp180.getTemperature(T);
    if (status != 0) {
    delay(status);
//      Serial.print("Temp: ");
//      Serial.print(T, 1);
//      Serial.println(" deg C");
//
//      status = bmp180.startPressure(3);
//
//      if (status != 0) {
//        delay(status);
//
//        status = bmp180.getPressure(P, T);
//        if (status != 0) {
//          Serial.print("Pressure measurement: ");
//          Serial.print(P);
//          Serial.println(" hPa (Pressure measured using temperature)");
//
//        }
//      }
    }
  }
  return (float)T;
}

// returns the distance (cm)

float measureDistance() {
  digitalWrite(sensor_pin, HIGH);
  delay(100);
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH); // We send a 10us pulse
  delayMicroseconds(10);
  // delay(1);
  digitalWrite(trigPin, LOW);
  uint32_t duration = pulseIn(echoPin, HIGH,26000); // We wait for the echo to come back, with a timeout of 20ms, which corresponds approximately to 3m
  // long duration = pulseIn(echoPin, HIGH);

  float distance = (duration/2) * 0.0291; // We calculate the distance (sound speed in air is aprox. 291m/s), /2 because of the pulse going and coming
  digitalWrite(sensor_pin, LOW); 
//  float distance = duration * 0.034 / 2;
  return distance;

}


void calAndBroadcast(float dis, float temp) {
  StaticJsonDocument<200> data;
//  JsonObject& jsonOut = dataJsonBuffer.createObject();
  if(address_set) {
    data["Id"]= address;
  }
  data["distance"] = dis;
  data["light"]=analogRead(light_sensor);
  data["Temp"]= temp;
  String output;
  serializeJson(data, output);
  sendMessage(output);
  
  String *clearing=&output;
  clearing=NULL;
}

/*
void checkBattery() {
   StaticJsonDocument<200> bat_status;
   //float inputVoltage = (float(analogRead(bat_pin))/4096) * 3.3;
   bat_status["battery_status"]=analogRead(bat_pin);
   String output=" V";
   serializeJson(bat_status,output);
   sendMessage(output);  
   
}
*/
void reboot() {
   NVIC_SystemReset();
   while (1);
}
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN  as an output.
  pinMode(LED_BUILTIN_1, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT
  pinMode(light_sensor,INPUT);
  pinMode(sensor_pin,OUTPUT); 
  
//  digitalWrite(sensor_pin, LOW); 
//  pinMode(bat_pin,INPUT);
//  analogWrite(bat_pin,0);
  
 // Wire1.begin();
 // Wire1.setClock(400000);

 // LoRa.setPins(csPin, resetPin, irqPin);// set CS, reset, IRQ pin
 
  if (!LoRa.begin(433E6)) {             // initialize ratio at 915 MHz
     Serial.println("LoRa init failed. Check your connections.");
    while (true);                       // if failed, do nothing
  }

  
// Initiate Temperature Sensor

  //bmp180.begin(0x76); 
   if (bmp180.begin()) {
      //Serial.println("BMP180 init success");
     }
    else
    {
      // Oops, something went wrong, this is usually a connection problem,
      // see the comments at the top of this sketch for the proper connections.

     // Serial.println("BMP180 init fail");
      while(1){}; // Pause forever.
     }

//  digitalWrite(charge_pin,HIGH);
  setAddress();
  LowPower.begin(); // for Low Power Mode
}

// the loop function runs over and over again forever
void loop() {
//  digitalWrite(LED_BUILTIN_1, HIGH);   // turn the LED on (HIGH is the voltage level)
  
//  delay(500);
  float dis;
  float temp;
//
//  digitalWrite(LED_BUILTIN_1, LOW);    // turn the LED off by making the voltage LOW
//  delay(500);
//  digitalWrite(LED_BUILTIN_1, HIGH);   // turn the LED on (HIGH is the voltage level)
//  delay(500);

 // temp = measureTemp();
  
 // while(!(200>dis && dis>20)){
 //        dis=measureDistance();
//  }
 // calAndBroadcast(dis,temp);
  //digitalWrite(LED_BUILTIN_1, LOW);    // turn the LED off by making the voltage LOW
  //delay(500);
  digitalWrite(LED_BUILTIN_1, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100); 
  digitalWrite(LED_BUILTIN_1, LOW);    // turn the LED off by making the voltage LOW
  
  delay(1000);              // wait for a second
 // LowPower.deepSleep(2000);
  //reboot();
 
}
