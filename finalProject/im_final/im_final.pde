//Citation: https://openprocessing.org/sketch/1015644

//
import processing.serial.*;
Serial myPort;
PFont font;

boolean menu=true;
boolean game1=false;
boolean game2=false;
boolean more=false;
boolean button1=false;
boolean button2=false;
boolean button3=false;
boolean button4=false;
int button_width=300;
int button_height=100;
int b1_x=250;
int b2_x=250;
int b3_x=250;
int b1_y=200;
int b2_y=400;
int b3_y=600;
int global_1;
int global_2;
int global_3;
int global_4;
boolean restart=false;
float seed = random(1000);
color colors[]={
  color(191, 236, 247), //light blue
  color(185, 197, 247), //light purple
  color(57, 79, 169), //dark blue
  color(115, 106, 97), //light grey
  color(215, 90, 34), //orange
  color(235, 61, 0)};

class Particle { //create a particle class (each circle is a particle) to control the movement of thr circles
  PVector position; // initialize position as vector with x position and y position
  float velocity;
  int size;
  color c;
  Particle() {
    position= new PVector(mouseX+(global_1*0.5), mouseY-(global_4*0.5)); //starting pisition is the position of the mouse
    velocity = random(3, 5); //alternate velocity to be between 3 and 5
    size = 1; //size of the circle starts at 1
    c = color(random(0, 255), random(0, 255), random(0, 255)); //random color
  }

  void update() {
    if (size >= 850) {  //if size reaches 700 then start over so it keeps looping
      size = 0;
    } else {
      size += velocity; //size increases as velocity increases (basically animates the circle)
    }
  }

  void display() {
    noFill(); //Using only stroke and not fill the circles overlap in really cool ways
    stroke(c);
    ellipse(position.x, position.y, size, size); //draw the circles at the mouse positions
  }
}

Particle[] particles= new Particle[1]; //initialize array of particles from the particle class

public class Brush { //brush class 
  public int x;
  public int y;
  public int px;
  public int py;
}
Brush brush = new Brush();

void setup () {

  size(800, 800);
  //font = cFont("Not_Bad.ttf");
  background(255);
  printArray(Serial.list());
  String portname=Serial.list()[1];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  font = createFont("fonts/Amfallen.ttf", 45);
}

void paint_drizzle() {
  float s = global_2+30/dist(brush.px, brush.py, brush.x, brush.y); //vary the strokeweight based on the sensor value and the position
  s=min(15, s);
  strokeWeight(s);
  stroke(0);


  line(brush.px, brush.py, brush.x, brush.y); //draw the brush following the mouse
  stroke(255);

  line(width-brush.px, height-brush.py, width-brush.x, height-brush.y); //draw the opposing brush in the other direction
}

void menu() {
  update_menu();
  fill(176, 189, 244);
  textFont(font);
  stroke(10,35,135);
  strokeWeight(3);
  text("How to break your Arduino?", 95, 90);
  fill(255);
  rect(b1_x, b1_y, button_width, button_height);
  fill(176, 189, 244);
  text("Try this", b1_x+50, b1_y+button_height/2+10);
  fill(255);
  rect(b2_x, b2_y, button_width, button_height);
  fill(176, 189, 244);
  text("Or this?", b2_x+60, b2_y+button_height/2+10);
  fill(255);
  rect(b3_x, b3_y, button_width, button_height);
  fill(176, 189, 244);
  text("What is this?",b3_x+5, b3_y+button_height/2+10);
}
void game1() {
  restart=false;

  brush.x+=(mouseX+(0.5*global_4)-brush.x)/12;
  brush.y+=(mouseY-brush.y)/12;
  if (frameCount>40) {
    paint_drizzle();
  }
  brush.px=brush.x;
  brush.py=brush.y;

  //update_game(mouseX, mouseY);
}
void game2() {
  restart=false;
  particles[0]= new Particle();
  for (int i=0; i < particles.length; i++) {//use a for loop to loop through array and redraw every circle in every frame
    Particle current = particles[i];
    strokeWeight(i%10); //variating the thickness of the stroke
    current.display();
    current.update();
  }
}

void game3() {
}


void draw() {

  if (restart) {
    background(202, 192, 190);
  }
  if (menu) {

    menu();
  }
  if (game1) {
    
    game1();
  }
  if (game2) {
    game1=false;
    game2();
    if(global_2==1 || global_3==1){
      
    }
  }
}

void mouseMoved() {

  if (game1) {
    if (frameCount%7==0) {
      paint_splatter(mouseX, mouseY);
      paint_splatter(width-global_4, height-global_1);
      stopping(global_4, global_1);
      stopping(width-mouseX, height-mouseY);
    }
  }
}

void paint_splatter(int bx, int by) { //function to create paint aplatter across sketch
  color c = colors[floor(random(colors.length))]; //choose the color from the colors array
  int curr_x=mouseX; //get the current x position
  int curr_y=mouseY; //get the current y position
  bx += random(-15, 15); //choose a random x position to draw the paint splatter
  by += random(-15, 15); //choose a random y position to draw the paint splatter
  int mx = 10*(mouseX-curr_x-250); 
  int my = 10*(mouseY-curr_y-250);
  for (int i=0; i<80; i++) {
    seed+=.01;
    float x = bx+mx*(0.5-noise(seed+i)); //use noise to distribute the splatter
    float y = by+my*(0.5-noise(seed+2*i));
    float s = 150/dist(bx, by, x, y); //get the size of the paint splatter
    if (s>20) s=20;
    float a = 255-s*5;
    noStroke();

    fill(c, a);
    ellipse(x, y, s, s);
    seed+=.03; //increment the seed to get sizes that vary by the noise
  }
}
void stopping(float bx, float by) { //making spaces between the paint splatters
  noStroke();
  float radius = random(1, 12); //get the random number that will be the size of the circle that creates the space
  ellipse(bx+random(-30, 30), by+random(30, -30), radius, radius);
  radius = random(3, 12);
  ellipse(bx+random(-30, 30), by+random(30, -30), radius, radius);
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
void update_menu() {
  if ( overRect(b1_x, b1_y, button_width, button_height) ) {
    button1 = true;
  }
  if ( overRect(b2_x, b2_y, button_width, button_height) ) {
    button2 = true;
  }
  if ( overRect(b3_x, b3_y, button_width, button_height) ) {
    button3 = true;
  }
}

void mousePressed() {

  if (menu) {
    if (button1) {
      menu=false;
      game1=true;
      restart=true;
    }
    if (button2) {
      menu=false;
      game2=true;
      restart=true;
    }
  }


  if (game2) {
    particles=(Particle[]) append(particles, new Particle());
  }
  if (button3) {
    menu=false;
    more=true;
  }
}

void serialEvent(Serial myPort) { //read all the sesor values from the arduino board
  String s=myPort.readStringUntil('\n');
  s=trim(s);
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));
    if (values.length==4) {
      global_1=(int)map(values[0], 0, 1023, 0, height);
      global_2=values[1];
      global_3=values[2];
      global_4=(int)map(values[3], 0, 10, 0, width);
    }
  }
  myPort.write("\n"); //preform the handshaking
}
