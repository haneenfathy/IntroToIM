// START CLICKING MOUSE TO START
// Particle class taught from Daniel Shiffman's Nature of Code

class Particle { //create a particle class (each circle is a particle) to control the movement of thr circles
  PVector position; // initialize position as vector with x position and y position
  float velocity; 
  int size;
  color c;
  Particle() {
    position= new PVector(mouseX, mouseY); //starting pisition is the position of the mouse
    velocity = random(3, 5); //alternate velocity to be between 3 and 5
    size = 1; //size of the circle starts at 1
    c = color(random(0, 255), random(0, 255), random(0, 255)); //random color
  }

  void update() {
    if (size >= 700) {  //if size reaches 700 then start over so it keeps looping
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

void setup(){
  size(600, 600);
  particles[0]= new Particle(); //starting circle
  background(255); //change background to white
}

void draw(){
  
  for (int i=0; i < particles.length; i++) {//use a for loop to loop through array and redraw every circle in every frame
    Particle current = particles[i];
    strokeWeight(i%8); //variating the thickness of the stroke
    current.display();
    current.update();
  }
}

void mousePressed() {
  particles=(Particle[]) append(particles,new Particle()); //append new circle on mouse click
}
void keyPressed(){
  save("art.png");
}
