class bullet extends GameObject {
  //instance
  // they get loc and vel from gameObject
  int timer;
  PVector aim;
  boolean bad;
  //contrsutors
  bullet() {
    super(player.loc.copy(), player.dir.copy(), 160);
    // no need to do a new PVector bcs its been taken from the superclass
    vel.setMag(8);
    timer = 60;
    diameter = 5;
    bad = false;
  }

  bullet(PVector ll, PVector vv, int lv) {
    super(ll, vv, lv);
    // no need to do a new PVector bcs its been taken from the superclass
    aim = new PVector (player.loc.x - loc.x, player.loc.y - loc.y);
    vel = aim;
    vel.setMag(8);
    timer = lv;
    diameter = 5;
    bad = true;
  }


  // behaviorsa
  void show() {
    if (!bad) {
      fill(black);
      stroke(white);
      strokeWeight(2);
      circle(loc.x, loc.y, diameter);
    } else if (bad) {
      fill(#29FF17);
      stroke(#29FF17);
      strokeWeight(2);
      circle(loc.x, loc.y, diameter);
    }
  }

  void act() {
    loc.add(vel);
    timer--;
    wrap();
    if (timer <= 0) lives = 0;
  }
}
