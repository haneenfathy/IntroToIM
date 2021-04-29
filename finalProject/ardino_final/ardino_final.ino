
int left = 0;
int right = 0;
const int trigPin = 10;
const int echoPin = 9;
const int lightSensor = A3;
long duration;
int distance;

void setup() {
  Serial.begin(9600);
  Serial.println("0,0,0,0");
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT);
  pinMode(lightSensor, INPUT);
  pinMode(A1, INPUT);
  pinMode(A0, INPUT);
}

void loop() {
  while (Serial.available()) {
    if (Serial.read() == '\n') {
      digitalWrite(trigPin, LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin, LOW);
      // Reads the echoPin, returns the sound wave travel time in microseconds
      duration = pulseIn(echoPin, HIGH);
      // Calculating the distance
      distance = duration * 0.034 / 2;
      // Prints the distance on the Serial Monitor

      int sensor1 = analogRead(A3);
      delay(1);
      int sensor2 = digitalRead(A0);
      delay(1);
      int sensor3 = digitalRead(A1);
      delay(1);
      Serial.print(sensor1);
      Serial.print(',');
      if (sensor2 == HIGH) {
        Serial.print("1");
      }
      else{
        Serial.print("0");
      }
      Serial.print(',');
      if (sensor3 == HIGH) {
        Serial.print("1");
      }
      else{
        Serial.print("0");
      }
      Serial.print(',');
      int test=6;
      if(distance>15){
        Serial.println(test);
      }
      else{
        Serial.println(distance);
        }
      
    }
  }
}
