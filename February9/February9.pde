
// flow field adapted from Daniel Shiffman's Nature of Code

import controlP5.*; //used the controlP5 library
ControlP5 cp5_angle; //slider to control angle
ControlP5 cp5_color; //slider to control color
ControlP5 cp5_noise; //slider to control noise

float inc = 1; //increment to y and x values of noise
int scale = 20; //scale of noise
int cols=floor(width / scale); //num of cols
int rows=floor(height / scale); //num of rows

float zoff = 0; //x value of noise


class Particle { //create a particle class )the particles will be dropped in the flow field to create the shape)
  PVector position; // initialize position as vector with x position and y position
  PVector velocity; // initialize velocity as vector with x position and y position
  PVector acceleration; // initialize acceleration as vector with x position and y position
  int maxspeed; //speed of the flow field
  PVector prevPos; //save the previous position to draw the line
  Particle() {
    position= new PVector(random(width), random(height)); //every particle starts at a ransom position
    velocity = new PVector(0, 0); //start velocity at zero
    acceleration = new PVector(0, 0); //start acceleration at zero
    maxspeed = 2; //define the speed
    prevPos = position.copy(); //copy positon to save the previous position
  }

  void update() { //move the particles through the field

    velocity.add(acceleration); //add acceleration to velocity
    velocity.limit(maxspeed); // limit velocity with the maxspeed
    position.add(velocity); //add velocity to position
    acceleration.mult(0); //reset acceleration
  }
  void applyForce(PVector force) {
    acceleration.add(force); //apply accelerationt to particles
  }

  void follow(PVector [] fields) { //function to follow the flow field by applying the forces to the particles
    int x= floor(position.x/scale);
    int y= floor(position.y/scale);
    int index=x + (y * cols);
    if (index<600) { //this because for some reason it goes over 600?
      PVector force = fields[index];
      applyForce(force);
    }
  }
  void display() { //display the particles
    Controller col = cp5_color.getController("Color"); //use controller to alter color slightly
    color c=color(255, 150, col.getValue(), 50);
    stroke(c);
    strokeWeight(random(1, 2)); //randomize stroke weight to give appearance of texture
    line(position.x, position.y, prevPos.x, prevPos.y); //draw lines
    updatePrev(); //update the previous position
  }
  void updatePrev() { 
    prevPos.x=position.x;
    prevPos.y=position.y;
  }
  void edges() {//don't go over the edge
    if (position.x > width) {
      position.x = 0;
      updatePrev();
    }
    if (position.x < 0) {
      position.x = width;
      updatePrev();
    }
    if (position.y > height) {
      position.y = 0;
      updatePrev();
    }
    if (position.y < 0) {
      position.y = height;
      updatePrev();
    }
  }
}

Particle[] particles= new Particle[100]; //initialize array of particles
PVector[] flowfield= new PVector[20*30]; //initialize array for the point in the flow field


void setup() {


  size(600, 400);

  cols=floor(width / scale);
  rows=floor(height / scale);


  for (int i = 0; i < 100; i++) {

    particles[i] = new Particle(); //fill particles array
  }
  cp5_angle = new ControlP5(this); //slider for angle (setting the parameters)
  cp5_angle.addSlider("Angle")
    .setPosition(40, 40)
    .setSize(100, 20)
    .setRange(0, TWO_PI)
    .setValue(TWO_PI)
    .setColorCaptionLabel(color(20, 20, 20));

  cp5_color = new ControlP5(this); //slider for color (setting the parameters)
  cp5_color.addSlider("Color")
    .setPosition(40, 65)
    .setSize(100, 20)
    .setRange(0, 255)
    .setValue(250)
    .setColorCaptionLabel(color(20, 20, 20));

  cp5_noise = new ControlP5(this); //slider for noise (setting the parameters)
  cp5_noise.addSlider("Noise")
    .setPosition(40, 90)
    .setSize(100, 20)
    .setRange(0.0001, 0.3)
    .setValue(0.3)
    .setColorCaptionLabel(color(20, 20, 20));


  background(255);
}

void draw() {

  Controller no = cp5_noise.getController("Noise");
  int yoff = 0;
  for (int y = 0; y < rows; y++) {
    int xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = x + (y * cols); //get index of every vector
      Controller co = cp5_angle.getController("Angle");
      float angle = noise(xoff, yoff, zoff) * co.getValue() ; //get angle of every vector in the flow field
      PVector v = PVector.fromAngle(angle); //set the angle
      v.setMag(1); //set the magnitude
      flowfield[index] = v; //assign the vector to the flow field
      xoff += inc; //increment the x offset
      stroke(0, 50);
    }
    yoff += inc; //increment the y offset

    zoff += no.getValue(); //get the z noise value from the slider
  }

  for (int i = 0; i < particles.length; i++) { //update the particles
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].edges();
    particles[i].display();
  }
}

void keyPressed() { //restart the sketch when you press a key as it gets too messy
  background(255);
}
