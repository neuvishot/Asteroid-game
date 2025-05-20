class rocks extends GameObject {
  float rots;
  int partimer = 10;
  boolean noLeft = false;

  rocks() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
  }

  rocks(PVector L, PVector V, int lv) {
    super(L, V, lv);
    loc = L;
    vel = V;
    lv = lives - 1;
  }

  rocks(float x, float y, float c, float k) {
    super(x, y, c, k);
    loc.add(x, y);
    vel.add(c, k);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rots++;
    drawRock();
    popMatrix();
  }

  void drawRock() {
    pushMatrix();
    diameter = lives*50;
    if (lives == 3) {
      rotate(radians(rots));
      fill(black);
      stroke(white);
      circle(0, 0, diameter);
      line(0-diameter/2, 0, 0+ diameter/2, 0);
      image(cat, 0, 0, diameter, diameter);
    } else if (lives == 2) {
      rotate(radians(rots));
      fill(yellow);
      stroke(white);
      circle(0, 0, diameter);
      line(0-diameter/2, 0, 0+ diameter/2, 0);
      image(squire, 0, 0, diameter, diameter);
    } else if (lives == 1) {
      rotate(radians(rots));
      fill(red);
      stroke(white);
      circle(0, 0, diameter);
      line(0-diameter/2, 0, 0+ diameter/2, 0);
      image(hamp, 0, 0, diameter, diameter);
    }
    popMatrix();
  }

  void act() {

    wrap();
    loc.add(vel);
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); // refering to the current objectdwa


      //      // ball bounce
      //      if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= obj.diameter + diameter && obj instanceof rocks) {
      //          float CurAstx = loc.x - obj.loc.x;
      //          float CurAsty = loc.y - obj.loc.y;

      //          obj.vel.x = - CurAstx / 15;
      //          obj.vel.y = -  CurAsty/ 15;
      //      }


      if (obj instanceof bullet && ((bullet)obj).bad == false) { // add goiod bullet boolean later
        // checking to see if the object nearing is of the bullet class
        // if the distance between these x and y's are less than their radius combined then..
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 3) {
             score++;
          lives = 0; // current objects lives (asteroid)
          obj.lives = 0; // bullet dies
       
          objects.add(new rocks(loc, vel.copy(), 2));
          objects.add(new rocks(loc.copy(), vel.copy().rotate(radians(random(100, 180))), 2));


          // particles
          while (partimer >=0) {
            objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
            partimer--;
          }// ---------------------------------------------------------------------------------------------------------
        } else if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 2) {
            score++;
          lives = 0;
          obj.lives = 0;
        
          objects.add(new rocks(loc, vel.copy(), 1));
          objects.add(new rocks(loc.copy(), vel.copy().rotate(radians(random(100, 180))), 1));

          // particles
          partimer = 10;
          while (partimer >=0) {
            objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
            partimer--;
          }
        } else if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 1) {
          lives = 0;
          score++;
          // particles
          partimer = 10;
          while (partimer >=0) {
            objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
            partimer--;
          }
          if (lives == 0) objects.remove(i);
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
