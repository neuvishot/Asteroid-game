class particle extends GameObject {
  int timer;
  PVector dir;

  // particle for spaceship
  particle() {
    super(player.loc.copy(), player.dir.copy(), 160);
    dir = new PVector(1, 0);
    diameter = 50;
    vel.setMag(-1);
  }


  // particle for bullet collisions
  particle(PVector ll, PVector vv, int lvv) {
    super(ll, vv, lvv);
    vel.rotate(radians(random(0, 360)));
  }

  void show() { // create random shapes here
    pushMatrix();
    translate(loc.x, loc.y);
    dir.rotate(-radians(3));
    fill(255, random(132, 215), 8);
    circle(0, 0, diameter);
    popMatrix();
  }

  void act() {
    
    rotate(dir.heading());
    move();
    dissapear();
  }

  void move() {
    loc.add(vel);
  }

  void dissapear() {
    lives--;
    wrap();
  }
}
