const int button_1 = 1; 
const int button_2 = 2;
const int button_3 = 3;


unsigned long time_1;
unsigned long time_2;
unsigned long time_3;

int before[3] = {6, 5, 4}; //array that holds the order the LEDs will light up with the first time

int after[3] = {6, 4, 5}; //array that holds the order the LEDs will light up with the second time


void setup() {
  pinMode(button_1, INPUT);    // set the first button pin to be an input
  pinMode(button_2, INPUT);   // set the second button pin to be an input
  pinMode(button_3, INPUT);   // set the third button pin to be an input

  pinMode(4, OUTPUT);   // set the red LED pin to be an output
  pinMode(5, OUTPUT);   // set the green LED pin to be an output
  pinMode(6, OUTPUT);   // set the blue LED pin to be an output

}

void loop() {

  for (int i = 0; i < 3; i++) { //for every LED light it up wait and then turn it off
    digitalWrite(before[i], HIGH);
    delay(1000);
    digitalWrite(before[i], LOW);
  }
  delay(3000);//wait three second and then show the second combination
  for (int i = 0; i < 3; i++) { //for every LED light it up wait and then turn it off
    digitalWrite(after[i], HIGH);
    delay(1000);
    digitalWrite(after[i], LOW);
  }

  if (digitalRead(button_1) == HIGH) { //record the time every button was clicked so we can compare them and see if the order inputted was correct
    time_1 = millis();
  }
  if (digitalRead(button_2) == HIGH) {
    time_2 = millis();
  }
  if (digitalRead(button_3) == HIGH) {
    time_3 = millis();
  }

  if (time_1 < time_2 && time_1 < time_3 && time_3 < time_2) { //if correct they will all light up
    digitalWrite(4, HIGH);
    digitalWrite(5, HIGH);
    digitalWrite(6, HIGH);
  }
  else { //if not then they will keep blinking
    digitalWrite(4, HIGH);
    digitalWrite(5, HIGH);
    digitalWrite(6, HIGH);
    delay(500);
    digitalWrite(4, LOW);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
  }

}
