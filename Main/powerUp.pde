class power extends GameObject {

  int timer;
  int edge;
  PVector aim;
  int partimer;
  float size;

  power() {
    super(random(width), random(height), 1);
    edge = (int)random(1, 4);
    aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
    vel = aim;
    timer = 300;
    diameter = 50;
    size = 0;
    loc.x = random(50, width-50);
    loc.y = random(50, height-50);
  }

  void show() {
    if (timer < 0) {
      pushMatrix();
      translate(loc.x, loc.y);
      scale(size);
      image(heart, 0, 0, 75, 75);
      popMatrix();
      size = size+ 0.1;
      if (size >= 1) {
        size = 1;
      }
    }
  }

  //make it appear in edge e.g:
  void act() {
    timer--;

    if (timer <= 0) {
      collision();
      appear();
    }
  }

  void collision() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
        if (obj instanceof bullet && ((bullet)obj).bad == false) { // colliding with player's bullets ---------------------------------
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < diameter/2 + obj.diameter/2) {
            timer = 300;
            partimer = 10;
            ((bullet)obj).lives = 0;
            lives = 0;
            player.powerful = true;

            if (partimer >=0) {
              objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
              objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
              objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
              objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
              objects.add(new particle(loc.copy(), vel.copy().rotate(radians(random(0, 360))), 60));
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
      loc.x = random(50, width-50);
      loc.y = random(50, height-50);
    }
  }
}
