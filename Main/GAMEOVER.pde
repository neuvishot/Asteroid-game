void gameover_button_instantiate() {
  toStart = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
  sad = new gifs("gameover/frame_", "_delay-0.03s.gif", 33, 3, width/2+50, height/2, width+400, height);
}
gifs sad;

void gameover() {
  background(red);
  
  sad.act();
  sad.show();
  
  toStart.show();
  toStart.clicked();
  

  if (toStart.clicked) {
    mode = starts;
  }
}

void gameoverClicks() {
}
