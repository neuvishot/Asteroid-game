class GameObject {
  // instantiate
  PVector loc, vel;
  int lives;
  float diameter;

  // constructor
  GameObject(float lx, float ly, int lv) {
    loc = new PVector(lx, ly);
    vel = new PVector(1, 0);
    lives = lv;
  }
    GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
  }

  GameObject(float lx, float ly, float vx, float vy, float d) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    diameter = d;
  }
  
  GameObject(PVector l, int lv) {
    loc = l;
    lives = lv;
  }
   GameObject( int lv) {
    lives = lv;
  }

  GameObject(PVector l, PVector v, int lv) { // i dont really understand lives
    loc = l;
    vel = v;
    lives = lv;

  }
  
  //behavior

  void act() {
      int i = 0;
  while (i < objects.size()) { // whats .size?
    // get = Get an entry at a particular index.
    // in this case, it is taking the index from the bullet array list, this is so that
    // it can skip from one bullet to the next in a loop
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  }

  void show() {
  }
  
   void wrap() {
    float a = diameter;
    if (loc.x > width + a) loc.x = -a;
    if (loc.x < -a) loc.x = width + a;
    if (loc.y > height + a) loc.y = -a;
    if (loc.y < -a) loc.y = height + a;
  }
}
