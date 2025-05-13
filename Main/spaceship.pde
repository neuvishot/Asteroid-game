class Spaceship extends GameObject {
  // instance variables
  // they get loc and vel from gameObject
  PVector dir;
  int cooldown, coolInt;
  int shield = 400;
  int imgTint = 60;
  int augh = 3;
  int partimer = 10;
  int powerTimer;
  boolean powerful;
  // nice to addd how many lives you have left

  // constructors
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    coolInt = 20;
    cooldown = coolInt;
    diameter = 30;
    lives = 3;
    powerTimer = 0;
    powerful = false;
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
    powerUp();
    //println(lives);
    powerful = false;
    // img tint
    imgTint = imgTint + augh;
    if (imgTint > 70 || imgTint < 20) augh = augh * -1;
  }



  // for act: -------------------------------------------------------------------------------------------
  void powerUp() {
    if (powerful) {
      powerTimer = 120;
    }

    if (powerTimer > 0) {
      text("Infinte bullets!!", width/2, height/2, 300, 300);
      powerTimer--;
      if (spacekey && powerTimer > 0 && frameCount % 3 == 0) {
        objects.add(new bullet());
      }
    }
  }

  void move() {
    loc.add(vel);
    int i = 3;
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
    shield--;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      // powerup ------------------------------------------------------------------------------------------------------- powerup
      if (obj instanceof power) { // colliding with player ---------------------------------
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2) {
          powerful = true;
          obj.lives = 0;
        }
      }

      // collision with ufo bullets -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      if (obj instanceof bullet && ((bullet)obj).bad == true) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && shield <= 0) {
          lives = lives -1;
          shield = 500;
          imgTint = 50;
          ((bullet)obj).lives = 0;

          if (partimer > 0) {
            objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
            partimer--;
          }
        }
      }

      if (obj instanceof rocks) { // collision wth asteroids---------------------------------------------------------------------------------------------------------------------
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && shield <=0) {

          lives = lives -1;
          shield = 500;
          imgTint = 50;
        }
      }

      // shield ---------------------------------------------------------------------------------------------------------------------
      if (shield >= 0) {
        pushMatrix();
        translate(loc.x, loc.y);
        rotate(dir.heading()+radians(90));
        tint(255, imgTint);
        image(shields, 0, -10, 90, 90);
        tint(255, 255);
        popMatrix();
      }

      if (lives <= 0) {
        mode = gameover;
        lose = true;
      }
      i++;
    }
  }
}
