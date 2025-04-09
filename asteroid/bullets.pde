class bullet {
  //instance
  PVector loc, vel;

  //contrsutors
  bullet() {
    loc = new PVector(player.loc.x, player.loc.y);
    vel = player.dir.copy(); // no need to do a new PVector bcs its been copied from another vector
    vel.setMag(8);
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
    if (loc.x > width + a) loc.x = -a;
    if (loc.x < -a) loc.x = width + a;
    if (loc.y > height + a) loc.y = -a;
    if (loc.y < -a) loc.y = height + a;
  }
}
