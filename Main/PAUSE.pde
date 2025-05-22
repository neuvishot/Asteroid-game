void pause_button_instantiate() {
  toGame = new button(width/2, height/2+50, 100, 50, white, black, "Resume", ".pic");
  ptoOver = new button(width/2, height/2+50, 350, 80, red, black, "G", ".png");
}

void pause() {
  ingame.pause();
  // buttons
  //fill(yellow, 50);
  //rect(width/2, height/2, width+3, height+3);
  fill(yellow);
  textSize(30);
  text("Game is Paused", width/2, height/2-20);


  toGame.show();
  toGame.clicked();
  toGame.words();
  toGame.size = 10;

  //ptoOver.size = 10;
  //ptoOver.show();
  //ptoOver.clicked();
  //ptoOver.words();

  if (toGame.clicked) {
    mode = game;
    ingame.play();
  }
  if (ptoOver.clicked) {
    mode = gameover;
    fail.rewind();
  }
}


void pauseClicks() {
}
