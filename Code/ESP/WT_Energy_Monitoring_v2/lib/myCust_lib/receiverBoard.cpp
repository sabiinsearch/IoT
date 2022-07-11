#include "Arduino.h"

#include "myCommon.h"
#include "Communication.h"
#include "receiverBoard.h"

int SwitchValue;   

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

 int checkTouchDetected(bool radioAvailability, int switch_value) {
  if(digitalRead(touch1) == HIGH){
        long press_start = millis();
        long press_end = press_start;
        int count_press = 0;

        while (digitalRead(touch1) == HIGH) {
          press_end = millis();
          count_press = press_end-press_start;
           if(count_press>3000) {
            reset_wifi(); // reset settings - wipe stored credentials for testing, these are stored by the esp library
            connectWiFi();
            break;
           }  
        } 
        
        
        publishData("pressed",radioAvailability);
        Serial.print("pressed for ");
        Serial.println(count_press);

        if(count_press<2500) {
         // check_WT();
          if (switch_value == 0){
            digitalWrite(SW_pin, 1);
            Serial.println("Motor Off");
            SwitchValue = 1;
            LED_allOff();
          } else {
            digitalWrite(SW_pin, 0);
            Serial.println("Motor On");
            SwitchValue = 0;
            LED_allOn();
          }
          delay(100);             
        }
  }
  return SwitchValue;
 }


