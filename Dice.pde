void setup() {
  size(400, 400);
  int index = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      dice[index] = new Die(50 + i * 100, 50 + j * 100);
      index++;
    }
  }
}

class Die {
  float x, y; 
  int value;  
  color c;  

  Die(float x, float y) {
    this.x = x;
    this.y = y;
    roll(); 
  }

  void roll() {
value = (int)(Math.random() * 6) + 1;
c = color(150 + (int)(Math.random() * (255 - 150)), 150 + (int)(Math.random() * (255 - 150)), 150 + (int)(Math.random() * (255 - 150)));  
}


  void show() {
    fill(c);     
    stroke(0);
    strokeWeight(1);          
    rect(x, y, 50, 50, 8); 
    fill(0);        
    noStroke();
    float cx = x + 25;
    float cy = y + 25;

    if (value == 1 || value == 3 || value == 5)
      ellipse(cx, cy, 6, 6);
    if (value >= 2) {
      ellipse(x + 15, y + 15, 6, 6);
      ellipse(x + 35, y + 35, 6, 6);
    }
    if (value >= 4) {
      ellipse(x + 35, y + 15, 6, 6);
      ellipse(x + 15, y + 35, 6, 6);
    }
    if (value == 6) {
      ellipse(x + 15, cy, 6, 6);
      ellipse(x + 35, cy, 6, 6);
    }
  }
}

Die[] dice = new Die[9]; 


void draw() {
  background(200, 220, 255);
  int total = 0;
  for (int i = 0; i < dice.length; i++) {
    dice[i].show();
    total += dice[i].value;
  }

  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Total: " + total, width / 2, height - 20);
}

void mousePressed() {
  for (int i = 0; i < dice.length; i++) {
    dice[i].roll();  
  }
}
