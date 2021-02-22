//citation: https://openprocessing.org/sketch/492906

int carSpeed = 3; //Speed of Racecar
int maxSpeed = 10; //Max speed racecar can go
int numOfCrashes; //Number of Crashes
int numOfLetters; //Number of Crashes
int crashLimit = 3; //The number of crashes allowed
int currentScore; //Current Score
int maxTime = 60*40*4/carSpeed; //Time Limit (60*numOfSecs)
int tempMaxTime = maxTime; //Temperary maxTime var for score calc
int time = maxTime+60*5+(carSpeed/2); //Time
int roadPoint; //Where on course you are
int maxRoad = maxTime*carSpeed; //Max Road Distance
//boolean gameStart = true; //Is the game playing?
boolean saveCalc = true; //Save the maxtime in an instance
boolean placeObs = true; //Place obstacles on track once
boolean finished; //Did you pass the finish line?
boolean failure; //Did you fail the game?
//boolean hazyScr; //Activate haze screen
Paper paper; //Racecar object
Obstacle[] obstacles = new Obstacle[20]; //Array of course obstacles
boolean begin=false; //begin game / show title screen
int rectX, rectY; 
int rectSize = 90;
color rectColor;
color currentColor;
color rectHighlight;
boolean rectOver = false;
String[] letters = {"a.png","b.png","c.png","d.png","e.png","f.png","g.png","h.png","i.png","j.png","k.png","l.png","m.png","n.png","o.png","p.png","q.png","r.png","s.png","t.png","u.png","v.png","w.png","x.png","y.png","z.png"};
void setup() {
  size(700, 700);
  paper = new Paper(0, height-100, "paper.png");
  rectX=(width/2)-50;
  rectY=height/2;
}

void draw() {
  update();
  if (begin==false) //draw home screen
  {
    background(0, 153, 153);
    textSize(32);
    text("THE LETTERS RACE", (width/2)-150, height/3); 
    fill(0, 51, 51);
    rect(rectX, rectY, 60, 30);
  }
  if (begin==true)
  {
    game();
  }
}
void update() {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    begin = true;
  }
}

void mousePressed() {
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void game() { //Play the game
  if (begin) {
    if (placeObs) {
      createObstacles(4*height/5);
      placeObs = false;
    }
    track();
    for (int i=0; i < obstacles.length; i++) {
      obstacles[i].show();
      obstacles[i].move();
    }
    displayCrashes();
    paper.show();
    paper.collision(obstacles);
    fail();
  }
}




void displayCrashes() { //Display the number of crashes
  textC("Crashes:" + numOfCrashes, 30, 60, 24, color(255));
}


void track() { //Display the race track
  roadPoint +=carSpeed;
  pushMatrix();
  translate(0, roadPoint);
  rectMode(CORNER);
  fill(0);
  rect(0, -3*maxRoad/2+height, width, 3*maxRoad/2);
  popMatrix();
}


void fail() { //If you fail the race

  if (time <= 0 || numOfCrashes >=crashLimit) {
    failure = true;
  }
  if (failure) {
    begin=false;
  }
}


void createObstacles(int obsSpacing) { //Creates obstacles at random points
  int placeIt=0; //Number obs placed in a row
  int decideFactor = 0;
  for (int i = 0; i < obstacles.length; i++) {
    obstacles[i] = new Obstacle(-1, 0, "r.png", false);
  }
  for (int i = 0; i <obstacles.length; ) {
    for (int y = -2*height; y >= -(maxRoad-height)+height/2; y-= obsSpacing) {
      for (int x = 1; x<=4; x++) {
        decideFactor = (int)random(1, 4);
        if (decideFactor == 1) { //Decide to place an obj based on random   
          if (placeIt < 3 && i < obstacles.length) {
            //If three obs are already placed do not place an obs
            int index = int(random(letters.length));
            obstacles[i] = new Obstacle(x, y, letters[index], false);
            placeIt++;
            i++;
          }
        }
      }
      placeIt=0;
    }
    i=obstacles.length; /*This will stop the loop from running when it random placements are done with the track. */
  }
}
void textC(String string, int x, int y, int size, color tColor) { //Simple text creator
  textSize(size);
  fill(tColor);
  text(string, x, y);
}

//void restartGame() { //Press 'r' to restart the game
//  if (keyPressed) {
//    if (key == 'r' || key == 'R') {
//      begin = false;
//      finished = false;
//      failure = false;
//      maxSpeed=10;
//      time = maxTime+60*5+(carSpeed/2);
//      maxRoad = maxTime*carSpeed;
//      numOfCrashes=0;
//      currentScore = 0;
//      roadPoint = 0;
//      saveCalc = true;
//      placeObs = true;
//      begin = true;
//    }
//  }
//}

void pauseGame() { //Press 'p' to pause the game
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      begin = !begin;
    }
  }
}


void maxTimeCalc() {
  maxTime = 60*40*4/carSpeed;
  if (saveCalc) {
    tempMaxTime = maxTime;
    saveCalc = false;
  }
}



void keyPressed() {
  //restartGame();
  pauseGame();

  if (key == 'a')
  {
    paper.x = paper.x -25;
  }
  if (key == 'd')
  {
    paper.x = paper.x + 25;
  }
}


class Obstacle {
  int x;
  int placementX;
  int y;
  int size;
  PImage img;
  String img_name;
  Boolean type; 
  Obstacle(int tempX, int tempY, String img_name, Boolean type_val) {
    x = tempX;
    y = tempY;
    img = loadImage("letters/"+img_name);
    size = img.width;
    type=type_val;
  }

  void show() { //Display the obstacles in a lane
    placementX = -width/8+x*(width/4);
    img.resize(300, 300);
    image(img, placementX, y);
  }

  void move() {
    y +=carSpeed;
  }
}

class Paper {
  int x;
  int y;
  int rWidth;
  int rHeight;
  boolean finished;
  PImage img;
  String img_name;
  Paper(int tempX, int tempY,  String img_name) {
    x = tempX;
    y = tempY;
    img = loadImage(img_name);
    rWidth = img.width/20;
    rHeight = img.height/20;
  }

  void show() { //Display the racer
    image(img, x, y-(rHeight/2),rWidth, rHeight);
  }



  void collision(Obstacle[] obstacles) { //Check if the car hits an obstacle
    for (int i = 0; i<obstacles.length; i++) {
      // This checks every obstacle
      for (int xval = x-rWidth/2; xval<=x+rWidth/2; xval++) { 
        //This checks all the X values within the sides of the vehicle
        if (xval > obstacles[i].placementX- obstacles[i].size/2 && xval < obstacles[i].placementX +obstacles[i].size/2 && obstacles[i].y > paper.y-rHeight/2 && obstacles[i].y < 630) {
          if (obstacles[i].type==true) {          
            numOfLetters++;
          }
          if (obstacles[i].type==false) {          
            numOfCrashes++;
          }

          maxSpeed -=2;
          carSpeed = constrain(carSpeed, 0, maxSpeed);
          obstacles[i].y = -maxRoad;
        }
      }
    }
  }
}
