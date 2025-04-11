class bullet extends GameObject {
  //instance
  // they get loc and vel from gameObject
  int timer;
  //contrsutors
  bullet() {
    super(player.loc.copy(), player.dir.copy(), 160);
    // no need to do a new PVector bcs its been taken from the superclass
    vel.setMag(8);
    timer = 60;
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
    timer--;
    wrap();
    if (timer == 0) lives = 0;
  }
}
