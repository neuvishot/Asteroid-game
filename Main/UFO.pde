class badShip extends GameObject {

  int timer;
  int alive;
  int edge;
  PVector aim;

  badShip() {
    super(random(width), random(height), 1);
    edge = (int)random(1, 4);
    aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
    vel = aim;
    vel.setMag(1);
    timer = 60;
    diameter = 10;
    alive = 0;
  }

  void show() {
    if (timer < 0 && alive > 0) {
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
    alive--;
    timer--;
    appear();
    shoot();
    wrap();
    loc.add(vel);

    if (alive < 0) {
      timer = 180;
    }
  }

  void appear() {
    if (timer == 0) {
      alive = 180;
      edge = (int)random(1, 4);
      aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
      vel = aim;
      vel.setMag(2);

      if (edge == 0) { // left
        loc.x = 0;
        loc.y = random(height);
      } else if ( edge == 1) { // top
        loc.x = random(width);
        loc.y = 0;
      } else if (edge == 2) { // right
        loc.x = width;
        loc.y = random(height);
      } else if (edge == 3) { // bottom
        loc.x = random(width);
        loc.y = height;
      }
    }
  }
  void shoot() {
  }
}
