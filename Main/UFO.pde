class badShip extends GameObject {

  int timer;
 

  badShip() {
    super(random(width), random(height), 1);
    vel.setMag(8);
    timer = 60;
  }

  void show() {
    pushMatrix();
    translate(300, 300);
    stroke(#666C34);
    strokeWeight(0.5);
    fill(#EAFCB0);
    quad(-28, 10, -20, 23, -10, 25, 0, 10);
    quad(28, 10, 20, 23, 10, 25, 0, 10);
    fill(#BFCE51);
    ellipse(0, 0, 70, 40);
    fill(255);
    ellipse(0, -10, 50, 40);
    noStroke();
    fill(#DEE0D3);
    ellipse(0, -1, 40, 19);
    image(ufo, 0, -9, 50, 50);
    popMatrix();
  }

//make it appear in edge e.g: 

  void act() {
    appear();
    shoot();
    wrap();
  }
  void appear() {
     int edge = (int)random(1, 4);
     
     if (edge == 0){ // left
       loc.x = 0;
       loc.y = random(height);
       
     } else if( edge == 1){ // top
       loc.x = random(width);
       loc.y = 0;
       
     } else if (edge == 2){
       
       
     } else if (edge == 3){
       
     }
     
    
    
    
  }
  void shoot() {
  }
}
