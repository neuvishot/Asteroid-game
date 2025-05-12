void game_button_instantiate() {
  toPause = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
  toOver = new button(width -100, height/2, 75, 75, red, black, "gameover", ".png");
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
    if (currentObject.lives == 0) {
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
    lose = true;
  }

    // behind heart ------------------------
    fill(#FFC036);
    noStroke();
    ellipse(190, 0, 100, 150);
    rectMode(LEFT);
    rect(-5, -5, 190, 75);
    stroke(0);
    rectMode(CENTER);

    if (player.lives == 3) {
      image(heart, 50, 40, 75, 75);
      image(heart, 120, 40, 75, 75);
      image(heart, 190, 40, 75, 75);
    } else if (player.lives  == 2) {
      image(heart, 50, 40, 75, 75);
      image(heart, 120, 40, 75, 75);
    } else if (player.lives  == 1) {
      image(heart, 50, 40, 75, 75);
    }
}

void gameClicks() {
}
