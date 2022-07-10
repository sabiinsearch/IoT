#include "Arduino.h"

#include "myCommon.h"
#include "Communication.h"
#include "receiverBoard.h"

// Setting the Tank LEDs accordingly
void LED_allOff() {
   digitalWrite(LED1_U,HIGH);
   digitalWrite(LED1_D,HIGH);
   digitalWrite(LED2_U,HIGH);
   digitalWrite(LED2_D,HIGH);
   digitalWrite(LED3_U,HIGH);
   digitalWrite(LED3_D,HIGH);
   digitalWrite(LED4_U,HIGH);
   digitalWrite(LED4_D,HIGH);
   digitalWrite(LED5_U,HIGH);
   digitalWrite(LED5_D,HIGH);
   getMyMsg();
   print_communication();
}

void LED_allOn() {
   digitalWrite(LED1_U,LOW);
   digitalWrite(LED1_D,LOW);
   digitalWrite(LED2_U,LOW);
   digitalWrite(LED2_D,LOW);
   digitalWrite(LED3_U,LOW);
   digitalWrite(LED3_D,LOW);
   digitalWrite(LED4_U,LOW);
   digitalWrite(LED4_D,LOW);
   digitalWrite(LED5_U,LOW);
   digitalWrite(LED5_D,LOW);
   getMyMsg();
   print_communication();
}

void initRGB(){
  digitalWrite(HEARTBEAT_LED,HIGH);
  digitalWrite(WIFI_LED,HIGH);
  digitalWrite(BLE_LED,HIGH);
  delay(1000);
  digitalWrite(HEARTBEAT_LED,LOW);
  digitalWrite(WIFI_LED,LOW);
  digitalWrite(BLE_LED,LOW);
 }