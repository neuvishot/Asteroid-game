class badShip extends GameObject {

  int timer;
  int edge;
  PVector aim;
  int partimer;

  badShip() {
    super(random(width), random(height), 1);
    edge = (int)random(1, 4);
    aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
    vel = aim;
    timer = 180;
    diameter = 40;
  }

  void show() {
    if (timer < 0) {
      pushMatrix();
      translate(loc.x, loc.y);
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
  }

  //make it appear in edge e.g:
  void act() {
    timer--;
    appear();
    loc.add(vel);

    if (timer < 0) {
      shoot();
      collision();
      if (loc.x > width + diameter + 10 || loc.x < -diameter - 10|| loc.y > height + diameter + 10 || loc.y < -diameter -10) {
        timer = 300;
      }
    }
  }

  void collision() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      if (obj instanceof bullet && ((bullet)obj).bad == false) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2) {
          timer = 300;
          partimer = 10;
          ((bullet)obj).lives = 0;

          if (partimer >=0) {
            objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
            partimer--;
          }
        }
      }
      i++;
    }
  }


  void appear() {
    if (timer == 0) {
      edge = (int)random(1, 4);
      aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
      vel = aim;
      vel.setMag(2);

      if (edge == 0) { // left
        loc.x = -diameter;
        loc.y = random(height);
      } else if ( edge == 1) { // top
        loc.x = random(width);
        loc.y = -diameter;
      } else if (edge == 2) { // right
        loc.x = width + diameter;
        loc.y = random(height);
      } else if (edge == 3) { // bottom
        loc.x = random(width);
        loc.y = height + diameter;
      }
    }
  }
  void shoot() {
    if (frameCount % 30 == 0) {
      objects.add(new bullet(loc.copy(), vel.copy(), 60));
    }
  }
}
