class particle extends GameObject {
  PVector dir;
  float big;
  // particle for spaceship
  particle() {
    super(player.loc.copy(), player.dir.copy(), 60);
    dir = new PVector(1, 0);
    diameter = 25;
    vel.setMag(random(-2, -.5));
    vel.rotate(radians(random(-80, 80)));
    big = random(10, diameter);
  }


  // particle for bullet collisionsw
  // so basically new particle(curobject.loc.x, curobject.loc.y) ykykykyk
  particle(int lvv) {
    super(lvv); // lives should b 
    // idk how to make the particles work
    dir = new PVector(1, 0);
    diameter = 25;
    big = random(10, diameter);
    vel.rotate(radians(random(0, 360)));
  }

  void show() { // create random shapes here
    pushMatrix();
    translate(loc.x, loc.y);
    //dir.rotate(-radians(3));
    float m = map(lives, 0, 60, 0, 255);
    float reduction = map(lives, 0, 60, 0, 1);

    scale(reduction);
    fill(255, random(132, 215), 8, m);
    circle(0, 0, big);
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
