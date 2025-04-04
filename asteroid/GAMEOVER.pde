void gameover_button_instantiate() {
  gameoverbut = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
}

void gameover() {
  background(red);
  gameoverbut.show();
  gameoverbut.clicked();
}

void gameoverClicks() {
}
