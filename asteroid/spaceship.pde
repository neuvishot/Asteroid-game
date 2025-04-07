class Spaceship {
  // instance variables
  PVector loc, vel, dir, back;
  // nice to addd how many lives you have left

  // constructors
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(1, 0);
    back = new PVector(-1, 0);
  }


  // behavior functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());

    drawship();
    popMatrix();
  }
  // for show
  void drawship() { //im[rpve how this looks
    fill(white);
    stroke(white);
    strokeWeight(2);
    triangle(-10, -10, -10, 10, 30, 0);
    fill(black);
    stroke(black);
    circle(10, 0, 5);
  }


  void act() {
    move(); // up down arrows
    shoot(); // maybe mouse?
    checkForCollisions(); // i have no udea lmfao
  }

  // for act:
  void move() {
    loc.add(vel);
    
     if (vel.x > 2){
     vel.setMag(2);
    }
    if (upkey)vel.add(dir);
    if (downkey) vel.add(back);
    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
    
    if (loc.x > 600) loc.x = 0;
  }
  void shoot() {
  }

  void checkForCollisions() {
  }
}
