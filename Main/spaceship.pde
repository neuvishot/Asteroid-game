class Spaceship extends GameObject {
  // instance variables
  // they get loc and vel from gameObject
  PVector dir;
  int cooldown, coolInt;
  int shield = 400;
  int imgTint = 60;
  int augh = 3;
  int partimer = 10;
  boolean power;
  int erm = 0;
  float telpx, telpy;
  // nice to addd how many lives you have left

  // constructors
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    coolInt = 20;
    cooldown = coolInt;
    diameter = 30;
    lives = 3;
    power = false;
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

    popMatrix();
  }


  void act() {
    move();
    shoot();
    wrap();
    checkForCollisions();
    if (teleport.clicked) {
      teleport();
      telpx = random(width);
      telpy = random(height);
    }
  }
  // for act: -------------------------------------------------------------------------------------------
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


  int coolPower;
  float bar;

  void shoot() {
    cooldown--;
    coolPower--;

    bar = map(coolPower, 0, 120, 0, PI*2);
    if (spacekey && cooldown <= 0 || downkey && cooldown <= 0) {
      objects.add(new bullet());
      cooldown = coolInt;
    }

    if (power) {
      coolPower = 120;
      power = false;
    }

    if (coolPower > 0) {
      text("Spam the Spacekey!!", width/2, height/2);

      noFill();
      strokeWeight(4);
      stroke(yellow);
      arc(loc.x, loc.y, 100, 100, 0, bar);

      //rect(width/2- 100, height/2+20, coolPower, 50);
      if (spacekey && frameCount % 3 == 0) {
        objects.add(new bullet());
      }
    }
    if (coolPower == 0) {
      power = false;
      objects.add(new power());
    }
  }


  void teleport() {
    int trys = 10;
    boolean yay = false;

    //float safeDistance;
    telpTime = 180;
    activated = false;
    erm = 0;
    // checking if its safe --------------------------------------------------------
    while (erm < objects.size()) {
      GameObject currentObject = objects.get(erm);

      //for (int a = 0; a < trys; a++) {
      if (currentObject instanceof rocks) {
        float d = dist(telpx, telpy, currentObject.loc.x, currentObject.loc.y);
        if (d > player.diameter/2 + currentObject.diameter/2) {
          yay = true;
        } else if (d < player.diameter/2 + currentObject.diameter/2) {
          yay = false;
        }
      }
      //}
      erm++;
    }
    if (yay) {
      player.loc.x = telpx;
      player.loc.y = telpy;
      yay = false;
      erm = 0;
    } else {
      println("it dont work");
    }
  }

  void checkForCollisions() {
    int i = 0;
    shield--;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);


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
        rotate(dir.heading());
        //tint(255, imgTint);
        //tint(255, 50);
        //image(shields, 0, -10, 90, 90);
        //tint(255, 255);
        stroke(#51FA79);
        noFill();
        circle(-5, 0, 50);
        circle(35, 0, 20);
        circle(25, -20, 20);
        circle(25, 20, 20);
        popMatrix();
      }

      if (lives <= 0) {
        mode = gameover;
        win = false;
      }
      i++;
    }
  }
}
