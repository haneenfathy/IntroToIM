// http://programmingjustforfun.blogspot.com/2015/11/7-paddle-and-bouncing-ball.html

import processing.serial.*; //import the Serial library
Serial myPort;  //the Serial port object
int width = 700;
int height = 700;
void setup() {
  // 500 pixels wide, 400 pixel height
  // This call will set system variables (width, height)
  size(500, 400);
  rectMode(CENTER);
  printArray(Serial.list());
  String portname=Serial.list()[1];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

//class Ball{
  
//}
// Variables to keep track of position and speed of ball
int x = 0;
int y = 100;
int x_speed = 3;
int y_speed = 3;
// Variables to keep track of paddle
int x_paddle = 250, y_paddle = 370;
int paddle_width_half = 40;
// score keeping
int score = 0;

void update() { //update the position of the ball here
  x = x + x_speed; 
  y = y + y_speed;
  if (y<0)
    y_speed = -y_speed;
  if (x>width || x<0)  
    x_speed = -x_speed;
}

void check_edges() { //check if the ball hits the wall
  if (x_paddle>width) x_paddle = width;
  if (x_paddle<0) x_paddle = 0;
}

void check_paddle() { //check if the ball hits the paddle
  if ((x_paddle-paddle_width_half)<x && (x_paddle+paddle_width_half)>x && 
    (y_paddle-10)<y && (y_paddle)>y) {
    // ball is hitting paddle rectangle, reverse y_speed
    y_speed = -y_speed;
    score = score + 1;
  }
}

void display_score() { //displayy the score on the 
  textSize(16);
  textAlign(RIGHT);
  text("Score", 80, 390);
  textAlign(LEFT);
  text(score, 90, 390);
}
void draw() {
  // Update position by adding speed
  update();
  // Check if paddle is at edge of screen 
  check_edges();
  // Check if ball collides with paddle
  check_paddle();
  // Clear screen to black
  background(255);
  // Set fill color to white
  fill(0);
  // Draw a circle at position x,y, 10 pixels large
  ellipse(x, y, 10, 10);
  // draw paddle
  rect(x_paddle, y_paddle, paddle_width_half*2+1, 11);
  // Display score
  display_score();
  
  if (y>height) { //if ball falls then its g ameover
    textSize(40);
    textAlign(CENTER);
    text("Game over", 250, 150);
  }
}

void serialEvent( Serial myPort) {
  //put the incoming data into a String - 
  //the '\n' is our end delimiter indicating the end of a complete packet
  String val = myPort.readStringUntil('\n');
  print(val);
  //make sure our data isn't empty before continuing
  if (val != null) {
    //trim whitespace and formatting characters (like carriage return)
    val = trim(val);
    println(val);
    int value=int(val);
    if (value==1) {
      x_paddle = x_paddle + 4; //move to the right
    }
    if (value==2) {
      x_paddle = x_paddle - 4; //move to the left
    }
  }
  myPort.write("\n"); //handshake
}
