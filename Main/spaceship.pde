class Spaceship extends GameObject {
  // instance variables
  // they get loc and vel from gameObject
  PVector dir;
  int cooldown, coolInt;
  int shield = 300;
  int imgTint = 60;
  int augh = 3;
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

    // behind heart ------------------------
    fill(#FFC036);
    noStroke();
    ellipse(190, 0, 100, 150);
    rectMode(LEFT);
    rect(-5, -5, 190, 75);
    stroke(0);
    rectMode(CENTER);

    if (lives == 3) {
      image(heart, 50, 40, 75, 75);
      image(heart, 120, 40, 75, 75);
      image(heart, 190, 40, 75, 75);
    } else if (lives == 2) {
      image(heart, 50, 40, 75, 75);
      image(heart, 120, 40, 75, 75);
    } else if (lives == 1) {
      image(heart, 50, 40, 75, 75);
    }
  }


  // for show
  void drawship() {
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
    //println(lives);

    // img tint
    imgTint = imgTint + augh;
    if (imgTint > 70 || imgTint < 20) augh = augh * -1;
  }

  // for act:
  void move() {
    loc.add(vel);
    int i = 2;
    if (vel.mag() > i) {
      vel.setMag(i);
    } else if (vel.mag() < -i) {
      vel.setMag(-i);
    }
    if (upkey) { // oui oui baguette darling
      vel.add(dir);
      if (frameCount % 5 == 0) {
        objects.add(new particle());
      }
    }
    
    if (downkey) vel.sub(dir);
    if (upkey && downkey) vel.setMag(0);
    if (!upkey || !downkey)vel.setMag(vel.mag()/1.03);

    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
  }
  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0 || downkey && cooldown <= 0) {
      objects.add(new bullet());
      cooldown = coolInt;
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      shield--;

      if (shield >= 0) {
        pushMatrix();
        translate(loc.x, loc.y);
        rotate(dir.heading()+radians(90));
        tint(255, imgTint);
        image(shields, 0, -10, 90, 90);
        tint(255, 255);
        popMatrix();
      }


      if (obj instanceof rocks) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && shield <=0) {

          lives = lives -1;
          shield = 500;
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
