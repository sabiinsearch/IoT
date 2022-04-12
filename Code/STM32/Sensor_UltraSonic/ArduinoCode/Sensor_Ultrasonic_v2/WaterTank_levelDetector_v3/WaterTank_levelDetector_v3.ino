#define ECHOPIN 10
#define TRIGPIN 9

void setup() {
  Serial.begin(9600);
  pinMode(ECHOPIN,INPUT_PULLUP);
  pinMode(TRIGPIN, OUTPUT);
  digitalWrite(ECHOPIN, HIGH);
}

void loop() {
  digitalWrite(TRIGPIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIGPIN, HIGH);
  delayMicroseconds(15);
  digitalWrite(TRIGPIN, LOW);
  int distance = pulseIn(ECHOPIN, HIGH, 26000);
  distance=distance/58;

  Serial.print(distance);
  Serial.println("   cm");
  delay(50);
}
