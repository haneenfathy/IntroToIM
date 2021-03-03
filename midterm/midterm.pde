//citation: https://openprocessing.org/sketch/492906
PFont fun; //font object for english font
PFont arabic; //font object for arabic font

import processing.sound.*;
SoundFile hitSound; //sound object for hit sound
SoundFile missSound; //sound object for miss sound

int paperSpeed = 6; //speed of the paper that collects the letters
int maxSpeed = 10; //max speed of the letters
int numOfCrashes; //Number of Crashes
int numOfLetters; //Number of letters collected of a gievn word
int maxTime = 60*1000*4/paperSpeed; //time limit of the game before it stops (lost)
int roadPoint; //Where on course you are
int track = maxTime*paperSpeed; //Max Distance of track
int wordscollected=0; //words collected
boolean placeObs = true; //Place letters on track once and show in intervals
Paper paper; //Paper object
Letter[] letters = new Letter[200]; //Array of random numbers of letters
boolean begin=false; //begin game / show title screen 
color textColorStart; //color of start text (changes when hovered)
color textColorInst; //color of instructions text (changes when hovered)
color textColorBack; //color of back text (changes when hovered)
int level=0; //level of game
int maxLevel=4; //max level of game before restarting
boolean rectOver = false;
boolean instructions=false;
boolean home=true;
ArrayList<ArrayList<String> > levels =  new ArrayList<ArrayList<String> >(4); 
String[] letters_list = {"a", "b", "c", "d", "e", "e", "e", "e", "f", "g", "h", "h", "h", "h", "i", "j", "k", "l", "l", "l", "l", "m", "n", "o", "o", "o", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
String[] words={"hello", "love", "food", "house"};
String[] wordsAR={"مرحباً", "حب", "اكل", "منزل"};
ArrayList<String> level1;
ArrayList<String> level2;
ArrayList<String> level3;
ArrayList<String> level4;

void setup() {
  size(700, 700);
  hitSound = new SoundFile(this, "sounds/hit.mp3");
  missSound = new SoundFile(this, "sounds/miss.mp3");
  paper = new Paper(0, height-100, "images/paper.png");
  fun = createFont("fonts/AttackGraffiti-3zRBM.ttf", 80);
  textColorStart= color(255);
  textColorInst= color(255);
  textColorBack=color(255);
  //initialize every array with the letters of the words
  level1 = new ArrayList<String>();
  level1.add("h");
  level1.add("e");
  level1.add("l");
  level1.add("l");
  level1.add("o");
  levels.add(level1);

  level2 = new ArrayList<String>();
  level2.add("l");
  level2.add("o");
  level2.add("v");
  level2.add("e");
  levels.add(level2);

  level3 = new ArrayList<String>();
  level3.add("f");
  level3.add("o");
  level3.add("o");
  level3.add("d");
  levels.add(level3);

  level4 = new ArrayList<String>();
  level4.add("h");
  level4.add("o");
  level4.add("u");
  level4.add("s");
  level4.add("e");
  levels.add(level4);
}

void draw() {
  hoverColorStart(); //change color when hovering over word
  hoverColorInstru(); //change color when hovering over word
  hoverColorBack(); //change color when hovering over word
  if (level==maxLevel) { //if maxlevel achieved restart game by resetting all variables
    begin=false;
    level=0;
    track = maxTime*paperSpeed;
    numOfCrashes=0;
    wordscollected = 0;
    placeObs = true;
  }
  if (begin==false && instructions ==false) //draw home screen
  {
    home();
  }
  if (begin==true) //start playing game
  {
    game();
  }
  if (begin==false && instructions==true) //draw instructions screen
  {
    instructions();
  }
}

void home() { //draw home screen
  background(255, 234, 248, 255); 
  textFont(fun);
  fill(255, 0, 38, 255);
  text("THE LETTER RACE", (width/2)-330, height/3); //title
  textSize(20);
  text("Learn language the fun way!", (width/2)-150, height/2); //catch phrase
  fill(255, 234, 248, 255);
  stroke(255, 0, 38, 255);
  rect((width/2)-110, 400, 200, 40); //rectangle to contain start button
  rect((width/2)-110, 475, 200, 40);//rectangle to contain instructions button
  fill(textColorStart);
  text("Start", (width/2)-50, 430);
  fill(textColorInst);
  text("Instructions", (width/2)-80, 500);
}
void instructions() {

  background(255);
  fill(0);
  textSize(32);

  text("Instructions", (width/2)-100, height/3-150); 
  text("The objective of this game is to test your knowledge of different Arabic vocab. Move the paper using your mouse to collect the letters_list that form the word. Once the word is collected, you will move to the next level to a harder word.", (width/2)-300, 200, 650, 400);
  rect(10, 10, 200, 40);
  fill(textColorBack);
  text("Back", 60, 40);
}


void hoverColorStart() {

  if ( overRect((width/2)-110, 400, 200, 40) ) { //hover over area of swquare if mouse is there then change color so user knows it's responsive
    print("hovering start");
    textColorStart= color(255, 0, 38, 255);
  } else if ( !overRect((width/2)-110, 400, 200, 40) ) {   
    textColorStart= color(255);
  }
}

void hoverColorInstru() {

  if ( overRect((width/2)-110, 475, 200, 40) ) {   //hover over area of swquare if mouse is there then change color so user knows it's responsive 
    textColorInst= color(255, 0, 38, 255);
  } else if ( !overRect((width/2)-110, 475, 200, 40) ) {    
    textColorInst= color(255);
  }
}

void hoverColorBack() {//hover over area of swquare if mouse is there then change color so user knows it's responsive

  if ( overRect(10, 10, 200, 40) ) {    
    textColorBack= color(255, 0, 38, 255);
  } else if ( !overRect(10, 10, 200, 40) ) {    
    textColorBack= color(255);
  }
}

void update() { //function to respond to clicks from the mouse 
  print("called update");

  if ( overRect((width/2)-110, 400, 200, 40)  ) {
    begin = true;
  }
  if ( overRect((width/2)-110, 475, 200, 40)) {
    instructions = true;
  }
  if ( overRect(10, 10, 200, 40) ) {    
    instructions=false;
  }
}

void mouseClicked() {
  update(); //check for any action when mouse is clicked
}

boolean overRect(int x, int y, int width, int height) { //function receives the position of a rectangle and then checks to see if mouse is within the bounds 

  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {

    print("inside true"+"\n");
    return true;
  } else {
    print(mouseX+"\n");
    print(mouseY+"\n");
    print(x+"\n");
    print(y+"\n");
    print(x+width+"\n");
    print(y+height+"\n");
    print("inside false"+"\n");
    return false;
  }
}

void game() { //Play the game
  if (begin) { //if begin is true start the game
    if (placeObs) { //place the obstacles by calling the create letters function if place objects is true
      createLetters(4*height/5); // pass the spacing between the letters as a parameter to the function
      placeObs = false; // set place objects as false
    }
    track(); //draw the continuous track
    for (int i=0; i < letters.length; i++) { //for every letter display it

      letters[i].show();
      letters[i].move();
    }
    displayCrashes(); //display the wrong hits
    displayWord();// display the word that the user is supposed to catch
    paper.show(); //show the paper
    paper.collision(letters); //check for collisions between the paper and the letter
    restartGame(); // restart game checks is r is clicked and restarts the game
  }
}

//255,132,210,255
//255,234,248,255

void displayWord() { //display word and change it when level changes

  textSize(80);
  fill(255, 0, 38, 255);
  arabic = createFont("fonts/Janna.ttf", 80);
  textFont(arabic);
  text(wordsAR[level], width-300, 90);
}

void displayCrashes() { //Display the number of crashes
  textSize(24);
  fill(color(0));
  text("Crashes:"+ numOfCrashes, 30, 60);
  text("Letters Collected:" + wordscollected, 30, 100);
}

void textC(String string, int x, int y, int size, color tColor) { //Simple text creator
  textSize(size);
  fill(tColor);
  text(string, x, y);
}
void track() { //Display the race track
  roadPoint +=paperSpeed; //increase the road by the speed of the objects
  pushMatrix(); //draw the road at every point
  translate(0, roadPoint);
  rectMode(CORNER);
  fill(255);
  rect(0, -3*track/2+height, width, 3*track/2);
  popMatrix();
}


void createLetters(int obsSpacing) { //Creates letters at random points
  int placeIt=0; //Number obs placed in a row
  int randomPlacement = 0; // based on a random value decide if you will place or not
  for (int i = 0; i < letters.length; i++) {
    letters[i] = new Letter(-20, 0, "r", false);//intialize the first letter off the screen so we can start looping
  }
  for (int i = 0; i <letters.length; ) { //loop through every letter
    for (int y = -2*height; y >= -(track-height)+height/2; y-= obsSpacing) { //start from the top and place the letters at intervals based on the object spacing
      for (int x = 1; x<=4; x++) {
        randomPlacement = (int)random(1, 4);
        if (randomPlacement == 1) { //Decide to place an obj based on random so we don't get 3 objects at the same time every time
          if (placeIt < 3 && i < letters.length) {
            //If three objects are already placed do not place an object
            int index = int(random(letters_list.length)); //get index of random letter
            letters[i] = new Letter(x, y, letters_list[index], false); // place the random letters at the x and y positions
            placeIt++; // increase the number if obstacles that are pplaced on a row
            i++;
          }
        }
      }
      placeIt=0;//set to zero when y starts looping again
    }
    i=letters.length; /*This will stop the loop from running when it random placements are done with the track. */
  }
}


void restartGame() { //Press 'r' to restart the game
  if (keyPressed) {
    if (key == 'r' || key == 'R') { //reset all variables 
      begin = false;
      level=0;
      track = maxTime*paperSpeed;
      numOfCrashes=0;
      wordscollected = 0;
      placeObs = true;
    }
  }
}

void checkWordCollected(Letter letter, ArrayList<String> cLevel) { //check how many letters were collected
  if (cLevel.size()==0) {
    wordscollected=0;
    level++;
  }
  Boolean exists=false;
  for (int i=0; i<cLevel.size(); i++) {   
    if (letter.img_n.charAt(0)==cLevel.get(i).charAt(0)) {
      print(letter.img_n.charAt(0)+"\n");
      wordscollected++;
      hitSound.play();
      cLevel.remove(i);
      exists=true;
    }
  }
  if (exists==false) { 
    missSound.play();
    numOfCrashes++;
  }
}

void keyPressed() {
  restartGame();
}


class Letter {
  int x;
  float placementX;
  int y;
  int size;
  PImage img;
  String img_n;
  Boolean type; 
  Boolean hit;
  Letter(int tempX, int tempY, String img_name, Boolean type_val) {
    x = tempX;
    y = tempY;
    img_n=img_name;
    img = loadImage("letters/"+img_n+".png");
    size = img.height;
    type=type_val;
    hit=false;
  }

  void show() { //Display the letters in a lane
    placementX = map(x, 1, 4, 0+200, width-200);

    img.resize(200, 200);
    image(img, placementX, y);
  }

  void move() {
    y +=paperSpeed;
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
  Paper(int tempX, int tempY, String img_name) {
    x = tempX;
    y = tempY;
    img = loadImage(img_name);
    rWidth = img.width/20;
    rHeight = img.height/20;
  }

  void show() { //Display the racer
    move();
    image(img, x, y-(rHeight/2), rWidth, rHeight);
  }
  void move() {
    if (begin==true) {
      if (mouseX>=0 && mouseX<=width && mouseY>= 70 && mouseY <= height-70)
        x = mouseX-(rWidth/2);
    }
  }


  void collision(Letter[] letters) { //Check if the car hits an obstacle
    for (int i = 0; i<letters.length; i++) {
      // This checks every obstacle
      for (int xval = x; xval<=x; xval++) { 
        //This checks all the X values within the sides of the vehicle

        if (xval > letters[i].placementX- 200/2 && xval < letters[i].placementX +200/2 && letters[i].y > paper.y-rHeight/2 && letters[i].y < 630) {
          print(xval+"xval \n");
          print(letters[i].placementX- 200/2+"xval2 \n");

          if (letters[i].type==false) {

            checkWordCollected(letters[i], levels.get(level));
            letters[i].hit=true;
          }

          letters[i].y = -track;
        }
      }
    }
  }
}
