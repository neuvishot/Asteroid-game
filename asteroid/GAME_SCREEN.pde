void game_button_instantiate() {
  gamebut = new button(width - 100, height - 100, 75, 75, white, black, pause, "text", ".pic");
}

void game() {
  background(black);
  gamebut.show();
  gamebut.clicked();

  toOver.show();
  toOver.clicked();
  toOver.words();
}

void gameClicks() {
}
