
/*
Name: Haneen Fathy
 Description:
 A data visualization assignment for the Intro to IM class. For this assignment, I decided to visualize the world happiness report as a bar graph 
 Due Date: 16-Feb-2021
 The source of my data is the Worl happiness dataset downloaded from kaggle
 link: https://www.kaggle.com/unsdsn/world-happiness
 
 */



int len =157;
int intervals=width/len;
Table table;
int[] positions = new int[0];
String[] names = new String[0];
color c = color(random(255), random(255), random(255));

void setup() {
  background(255);
  size(800, 700);
  table = loadTable("data.csv", "header");

  println(table.getRowCount() + " total rows in table");

  for (TableRow row : table.rows()) {

    int id = row.getInt("Overall rank");
    String country = row.getString("Country or region");
    String score = row.getString("Score");

    println(id + " (" + country + ") has a score of " + score);
    names=append(names, country );
  }
  
}

void draw() {
  background(255);
  int xpos=10;
  for (int i = 0; i < table.getRowCount()/2; i++) {
    print(table.getRowCount()/2);
    TableRow row = table.getRow(i);
    float score=row.getFloat("Score");
    float rectHeight = map(score, 2, 8, 0, height);
    
    fill(c);
    rect(xpos, 0, 10, rectHeight);
    positions=append(positions, xpos);
    xpos=xpos+10;
  }

  //int curr=0;
  for (int i = 0; i < table.getRowCount()/2; i++) {

    if (mouseX > positions[i]-10 && mouseX < positions[i]+10 && mouseY > -10 && mouseY < 10) {
        text(names[i],500,600);
        print(names[i]);

    }
  }
}
