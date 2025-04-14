class rocks extends GameObject {
  
  rocks() {
    super(random(width), random(height), 1, 1); // how do we tell how big the object is?
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    diameter = lives*50;
  }

  void show() {
    fill(black);
    stroke(white);
    circle(loc.x, loc.y, lives*50);
    line(loc.x, loc.y, loc.x+ lives*50/2, loc.y);
  }

  void act() {
    wrap();
    loc.add(vel);
    // like an, if lives are 3 biggest
    // if lvies = 2, its medium sized
    // if its 1, its the smallest ass
    // if its 0 its dead/
  }
}
