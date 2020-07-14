#include  <Arduino.h>

int triggerPin = 9; //triggering on pin 7
int echoPin = 8;    //echo on pin 8

void setup() {

//  Serial.begin(115200);  //we'll start serial comunication, so we can see the distance on the serial monitor
  Serial1 .begin(115200);

//  Serial1.begin(115200);


  pinMode(triggerPin, OUTPUT); //defining pins
  pinMode(echoPin, INPUT);

}

void loop() {

  int duration, distance;    //Adding duration and distance

  digitalWrite(triggerPin, HIGH); //triggering the wave(like blinking an LED)
  delay(10);
  digitalWrite(triggerPin, LOW);

  duration = pulseIn(echoPin, HIGH); //a special function for listening and waiting for the wave
  distance = (duration/2) / 29.1; //transforming the number to cm(if you want inches, you have to change the 29.1 with a suitable number
/*
  Serial.print(distance);    //printing the numbers
  Serial.print("cm");       //and the unit
  Serial.println(" ");      //just printing to a new line
*/
Serial1.print("SerualUART1");
//Serial2.print("Serial_2");


  //IF YOU WANT THE PORGRAM SPITTING OUT INFORMATION SLOWER, JUST UNCOMMENT(DELETE THE 2 //) THE NEXT LINE AND CHANGE THE NUMBER
  //delay(500);

}
