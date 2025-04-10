class GameObject {
  // instantiate
  PVector loc, vel;
  int lives;

  // constructor
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
  }

  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
  }

  GameObject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv = 1;
  }
  //behavior

  void act() {
  }

  void show() {
  }
}
