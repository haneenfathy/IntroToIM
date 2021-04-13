int button1 = A0;
int button2 = A1;

void setup() {
  Serial.begin(9600);
  Serial.println("0");
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  // put your setup code here, to run once:
}

void loop() {
  while (Serial.available()) {
    int right = digitalRead(button1);
    int left = digitalRead(button2);
    if (right == HIGH) {
      Serial.println("1");
    }
    else if (left == HIGH) {
      Serial.println("2");
    }
  }
  // put your main code here, to run repeatedly:

}
