void pause_button_instantiate() {
  pausebut = new button(width - 100, height - 100, 75, 75, white, black, game, "game", ".pic");
}

void pause() {
  background(white);
  pausebut.show();
  pausebut.clicked();
  pausebut.words();
  
  toOver.show();
  toOver.clicked();
  toOver.words();
}


void pauseClicks() {
}
