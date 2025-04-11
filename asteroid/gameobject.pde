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

  GameObject(PVector l, PVector v, int lv) { // i dont really understand lives
    loc = l;
    vel = v;
    lives = lv = 1;
  }
  //behavior

  void act() {
  }

  void show() {
  }
   void wrap() {
    int a = 20;
    if (loc.x > width + a) loc.x = -a;
    if (loc.x < -a) loc.x = width + a;
    if (loc.y > height + a) loc.y = -a;
    if (loc.y < -a) loc.y = height + a;
  }
}
