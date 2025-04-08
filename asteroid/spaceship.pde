class Spaceship {
  // instance variables
  PVector loc, vel, dir;
  // nice to addd how many lives you have left

  // constructors
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(1, 0);
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
    strokeWeight(1);
    triangle(-10, -10, -10, 10, 35, 0);
    ellipse(-15, 0, 25, 25);
    //wings
    fill(black);
   stroke(white);
    triangle(25, 5, -20, 25, -20, 5);
    triangle(25, -5, -20, -25, -20, -5);
    stroke(black);
    fill(red);
    // small triangle
    //triangle(0, -15, -20, -25, -20, -13);
    //triangle(0, 15, -20, 25, -20, 13);

    // big triangle
    triangle(25, -5, -20, -25, -20, -15);
    triangle(25, 5, -20, 25, -20, 15);



    // old deisng
    //fill(white);
    //stroke(white);
    //strokeWeight(2);
    //triangle(-10, -10, -10, 10, 30, 0);
    //fill(black);
    //stroke(black);
    //circle(10, 0, 5);
  }


  void act() {
    move(); // up down arrows
    shoot(); // maybe mouse?
    checkForCollisions(); // i have no udea lmfao
  }

  // for act:
  void move() {
    loc.add(vel);

    int i = 3;
    if (vel.mag() > i) {
      vel.setMag(i);
    } else if (vel.mag() < -i) {
      vel.setMag(-i);
    }
    if (upkey)vel.add(dir);
    if (downkey) vel.sub(dir);
    if (upkey && downkey) vel.setMag(0);
    if (!upkey || !downkey)vel.setMag(vel.mag()/1.03);

    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));


    int a = 15;
    if (loc.x > width + a) loc.x = -a;
    if (loc.x < -a) loc.x = width + a;
    if (loc.y > height + a) loc.y = -a;
    if (loc.y < -a) loc.y = height + a;
  }
  void shoot() {
  }

  void checkForCollisions() {
  }
}
