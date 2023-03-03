#include <Servo.h> // importing servo library
Servo myservo;

int sensorPin = A1; // select the input pin for LDR
int sensorValue = 0;// variable to store the value from the sensor
int servoPin = 3;
long timeLimit = 3000;
long time1 = 3000;
long time2 = 0;

void setup() {
  myservo.attach(servoPin);
  Serial.begin(9600);
}


void loop() {
  sensorValue = analogRead(sensorPin); // read the value from the sensor
  Serial.println(sensorValue);
  if(sensorValue < 750){
    time1 = millis();
    
    if(abs(time1 - time2) > timeLimit){
       myservo.write(60);
    }
    
  }else if (sensorValue >= 750){
    time2 = millis();

    if(abs(time1 - time2) > timeLimit){
       myservo.write(0);
    }
   
  }

  delay(100);

}
