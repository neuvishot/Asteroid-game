class bullet extends GameObject {
  //instance
  // they get loc and vel from gameObject
  int timer;
  //contrsutors
  bullet() {
    super(player.loc.copy(), player.dir.copy(), 160);
    // no need to do a new PVector bcs its been taken from the superclass
    vel.setMag(8);
    timer = 160;
  }


  // behaviors
  void show() {
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, 5);
  }

  void act() {
    loc.add(vel);
    int a = 20;
    timer--;
    if (timer == 0) lives = 0;
    if (loc.x > width + a) loc.x = -a;
    if (loc.x < -a) loc.x = width + a;
    if (loc.y > height + a) loc.y = -a;
    if (loc.y < -a) loc.y = height + a;
  }
}
