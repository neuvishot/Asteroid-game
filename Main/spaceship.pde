class Spaceship extends GameObject {
  // instance variables
  // they get loc and vel from gameObject
  PVector dir;
  int cooldown, coolInt;
  int shield = 240;
  boolean touch;
  // nice to addd how many lives you have left

  // constructors
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    coolInt = 20;
    cooldown = coolInt;
    diameter = 20;
    lives = 3;
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
    pushMatrix();
    scale(.7);
    fill(white);
    stroke(white);
    strokeWeight(1);
    triangle(-10, -10, -10, 10, 35, 0);
    ellipse(-15, 0, 25, 25);
    //wings
    fill(black);
    stroke(white);
    triangle(25, 3, -20, 25, -20, 5);
    triangle(25, -3, -20, -25, -20, -5);



    // small triangle
    fill(white);
    triangle(-5, -18, -20, -25, -20, -16);
    triangle(-5, 18, -20, 25, -20, 16);

    // make triangle change color
    fill(red);
    triangle(10, 0, -30, 15, -30, -15);

    //// big triangle
    //triangle(25, -5, -20, -25, -20, -15);
    //triangle(25, 5, -20, 25, -20, 15);



    // old deisng
    //fill(white);
    //stroke(white);
    //strokeWeight(2);
    //triangle(-10, -10, -10, 10, 30, 0);
    //fill(black);
    //stroke(black);
    //circle(10, 0, 5);
    popMatrix();
  }


  void act() {
    move();
    shoot();
    wrap();
    checkForCollisions(); // i have no udea lmfao
    println(lives);
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
  }
  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new bullet());
      cooldown = coolInt;
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      shield--;

      //while (shield >=0) {
      //  circle(loc.x, loc.y, 50);
      //}

      if (touch) {
        lives = lives -1;
        shield = 240;
      }

      if (obj instanceof rocks) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && shield <=0) {
          touch = true;
        } else {
          touch = false;
        }
      }

      if (lives <= 0) {
        mode = gameover;
        lose = true;
      }
      i++;
    }
  }
}
