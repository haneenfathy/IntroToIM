void setup() {
  size(600, 600);
}

void draw(){
  
  translate(width/2, height/2); //translated everything in the page to start in the center
  
  //face
  noStroke();
  fill(222,184,135);
  ellipse(0, 0, 340,400);
  
  //eyes
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(-80, -40, 60,40);
  ellipse(80, -40, 60,40);
  
  //pupils
  noStroke();
  fill(160,82,45);
  ellipse(-80, -40, 20,20);
  ellipse(80, -40, 20,20);
  
  //eyebrows
  noStroke();
  fill(43, 29, 14);
  rect(-120, -80, 70, 10);
  rect(60, -80, 70, 10);
  
  //nose
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(0, 20, 30, 60, 0, PI);
  
  //lips
  noStroke();
  fill(205, 92, 92);
  arc(0, 120, 70, 30, 0, PI);
  rotate(PI);
  arc(0, -118, 70, 30, 0, PI);
  
  //cheeks
  noStroke();
  fill(255, 157, 170,40);
  ellipse(-80, -40, 60,60);
  ellipse(80, -40, 60,60);
  
  //scarf
  noFill();
  stroke(100, 149, 237);
  strokeWeight(50);
  ellipse(0, 0, 340,400);
  
  //scarf continued
  noStroke();
  fill(100, 149, 237);
  rotate(-PI/3);
  rect(170, -13, 150, 120, 7);

}
