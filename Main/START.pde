void Start_instantiates() { // to lessen tab jumping
  startbutton = new button(width/2-50, height-150, 200, 100, red, white, "to game", ".png");
  start = new gifs("start/frame_", "_delay-0.03s.gif", 13, 3, width/2+50, height/2, width+300, height);
}

// global
gifs start;

void starts() {
  background(yellow);
  start.act();
  start.show();
  startbutton.show();
  startbutton.clicked();
  startbutton.words();

  if (startbutton.clicked) {
    mode = game;
  }
}

void startClicks() {
}
