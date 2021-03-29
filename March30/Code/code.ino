#include "pitches.h"
boolean on = false;
boolean off = false;

const int switch_on = A4;
const int switch_off = A5;
const int nLed = 3;
const int mLed = 5;

const int sound = 6;

// notes in the melody:
int melody[] = {

  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {

  4, 8, 8, 4, 4, 4, 4, 4
};

void melody_play() {
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second divided by the note type.

    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.

    int noteDuration = 1000 / noteDurations[thisNote];
    if (on == false && off == false) {
      tone(sound, melody[thisNote], noteDuration);
    }


    // to distinguish the notes, set a minimum time between them.

    // the note's duration + 30% seems to work well:

    int pauseBetweenNotes = noteDuration * 1.30;

    delay(pauseBetweenNotes);

    // stop the tone playing:

    noTone(sound);

  }
}
void setup() {
  Serial.begin(9600);
  pinMode(switch_on, INPUT);
  pinMode(switch_off, INPUT);
  pinMode(nLed, OUTPUT);
  pinMode(mLed, OUTPUT);
}
//
void alarm() {
  int analogValue = analogRead(A0);
  Serial.print("\n value is ");
  Serial.print(analogValue);

  if (analogValue < 600) {
    // sets the value (range from 0 to 255):
    digitalWrite(mLed, LOW);
    int val=map(analogValue,0,1023,0,255);
    analogWrite(nLed, val);
    // wait for 30 milliseconds to see the dimming effect
    delay(30);
  }
  else {
    digitalWrite(nLed, LOW);
    int val=map(analogValue,0,1023,0,255);
    analogWrite(mLed, val);
    // wait for 30 milliseconds to see the dimming effect
    delay(30);

  }
}


void loop() {
  if (on == false && off == false) {
    melody_play();
  }

  if (digitalRead(A4) == HIGH) {
    off = false;
    on = true;

  }
  if (digitalRead(A5) == HIGH) {
    off = true;
    on = false;

  }
  if (on) {

    alarm();
  }
  else if (off) {
    digitalWrite(nLed, LOW);
    digitalWrite(mLed, LOW);

  }



}
