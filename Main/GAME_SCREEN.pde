void game_button_instantiate() {
  toPause = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
  toOver = new button(100, height-100, 75, 75, red, black, "gameover", ".png");
}
// global d variable
int d = 100;

void game() {
  background(black);

  // player, bullets and asteroids ------------------------------------------------
  int i = 0;
  while (i < objects.size()) { // whats .size?
    // get = Get an entry at a particular index.
    // in this case, it is taking the index from the bullet array list, this is so that
    // it can skip from one bullet to the next in a loop
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0){
      objects.remove(i);
    } else {
      i++;
    }
  }

  player.show();
  player.act();

  // buttons ----------------------------------------------------
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
}
