
#include "pitches.h"
int melody[] = {
  NOTE_FS5, NOTE_FS5, NOTE_D5, NOTE_B4, NOTE_B4, NOTE_E5,
  NOTE_E5, NOTE_E5, NOTE_GS5, NOTE_GS5, NOTE_A5, NOTE_B5,
  NOTE_A5, NOTE_A5, NOTE_A5, NOTE_E5, NOTE_D5, NOTE_FS5,
  NOTE_FS5, NOTE_FS5, NOTE_E5, NOTE_E5, NOTE_FS5, NOTE_E5
}; //array of notes


const int led_1 = 13;
const int led_2 = 12;
const int led_3 = 11;
const int led_4 = 10;
const int button = 5;

const int trigPin = 2;
const int echoPin = 4;

const int buzzer = 8;

long duration;
int distance;
int durations[] = { //array of different durations that correspond to the notes
  8, 8, 8, 4, 4, 4,
  4, 5, 8, 8, 8, 8,
  8, 8, 8, 4, 4, 4,
  4, 5, 8, 8, 8, 8
};

int leds[] = {13, 12, 11, 10};

int songLength = sizeof(melody) / sizeof(melody[0]);
void setup() {
  // put your setup code here, to run once:
  pinMode(led_1, OUTPUT);
  pinMode(led_2, OUTPUT);
  pinMode(led_3, OUTPUT);
  pinMode(led_4, OUTPUT);
  pinMode(button, INPUT);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT);// Sets the echoPin as an Input
  pinMode(buzzer, OUTPUT);

  Serial.begin(9600);


}

void loop() {

  //turn all LEDs off
  digitalWrite(led_1, LOW);
  digitalWrite(led_2, LOW);
  digitalWrite(led_3, LOW);
  digitalWrite(led_4, LOW);
  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance = duration * 0.034 / 2;
  // Prints the distance on the Serial Monitor
  Serial.print("Distance: ");
  Serial.println(distance);
  // put your main code h++++7ere, to run repeatedly:
  int y = map(distance, 1, 20, 0, 23);
  int z = map(distance, 1, 20, 0, 3);
  int buttonState = digitalRead(button);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
    // pause the tone
    noTone(buzzer);
  }
  else {
    //play the tone from the array
    int duration_tone = 1000 / durations[y];
    tone(buzzer, melody[y], duration_tone);
    delay(1);

    digitalWrite(leds[z], HIGH); //turn on the corresponding LED
    delay(2);

  }



}
