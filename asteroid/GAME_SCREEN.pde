void game_button_instantiate() {
  toPause = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
  toOver = new button(100, height-100, 75, 75, red, black, "gameover", ".png");
}
// global d variable
int d = 100;

void game() {
  background(black);

  // asteroid
  fill(255);
  circle(loc.x, loc.y, d);
  loc.add(vel);

  if (loc.y < d/2 || loc.y > height-d/2) vel.y = -vel.y;
  if (loc.x < d/2 || loc.x > height-d/2) vel.x = -vel.x;
  // buttons
  toPause.show();
  toPause.clicked();
  if (toPause.clicked) {
    mode = pause;
  }

  toOver.show();
  toOver.words();
  toOver.clicked();
  
  if (toOver.clicked) {
    mode = gameover;
  }
}

void gameClicks() {
  vel.setMag(vel.mag()*1.1);
  println(vel.mag());
  println(degrees(vel.heading()));
}
