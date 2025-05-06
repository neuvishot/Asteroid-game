class badShip extends GameObject {

  int timer;

  badShip() {
    super(random(width), random(height), 1);
    vel.setMag(8);
    timer = 60;
  }
  
  void show(){
    
  }
  
  
  void act(){
   maneuver(); 
   shoot();
    
  }
  void maneuver(){
    
  }
  void shoot(){
    
  }
}

// ufo design not done, copy paste to another thing later
PImage ufo;

void setup() {
  size(600, 600);
  ufo = loadImage("ufo.png");
}

void draw() {
  imageMode(CENTER);
  println(mouseX, mouseY);
  pushMatrix();
  translate(300, 300);
  scale(4);
  
  fill(255);
  strokeWeight(0.5);
  quad(-28, 10, -20, 23, -10, 25, 0, 10);
  quad(28, 10, 20, 23, 10, 25, 0, 10);
  ellipse(0, 0, 70, 40);
  ellipse(0, -10, 50, 40);
  image(ufo, 0, -9, 50, 50);




  popMatrix();
}
