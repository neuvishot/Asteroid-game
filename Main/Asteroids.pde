class rocks extends GameObject {

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
    diameter = lives*50;
    if (lives == 3) {
      fill(black);
      stroke(white);
      circle(loc.x, loc.y, diameter);
      line(loc.x, loc.y, loc.x+ diameter/2, loc.y);
    } else if (lives == 2) {
      fill(yellow);
      stroke(white);
      circle(loc.x, loc.y, diameter);
      line(loc.x, loc.y, loc.x+ diameter/2, loc.y);
    } else if (lives == 1) {
      fill(red);
      stroke(white);
      circle(loc.x, loc.y, diameter);
      line(loc.x, loc.y, loc.x+ diameter/2, loc.y);
    }
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

      //// ball bounce
      //if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= obj.diameter + diameter) {
      //  if (obj instanceof rocks) {
      //    float CurAstx = loc.x - obj.loc.x;
      //    float CurAsty = loc.y - obj.loc.y;

      //    obj.vel.x = CurAstx / 15;
      //    obj.vel.y = CurAsty/ 15;
      //  }
      //}


      if (obj instanceof bullet) { // checking to see if the object nearing is of the bullet class
        // if the distance between these x and y's are less than their radius combined then..
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 3) {
          lives = 0; // current objects lives (asteroid)
          obj.lives = 0; // bullet dies
          objects.add(new rocks(loc, vel.copy(), 2));
          objects.add(new rocks(loc.copy(), vel.rotate(radians(random(100, 180))), 2));
        } else if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 2) {
          lives = 1;
          obj.lives = 0;
        } else if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2 && lives == 1) {
          lives = 0;
          if (lives == 0) objects.remove(i);
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
