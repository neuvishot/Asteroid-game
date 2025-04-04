void start_button_instantiate() { // to lessen tab jumping
  startbutton = new button(width/2, height/3, 200, 100, red, white, "sdsd", ".png");
}

void starts() {
  background(yellow);
  startbutton.show();
  startbutton.clicked();

  if (startbutton.clicked) {
    mode = game;
  }
}

void startClicks() {
}
