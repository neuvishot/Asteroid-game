void pause_button_instantiate() {
  toGame = new button(width - 100, height - 100, 75, 75, white, black, "game", ".pic");
}

void pause() {
  
  // buttons 
  background(white);
  toGame.show();
  toGame.clicked();
  toGame.words();

  toOver.show();
  toOver.clicked();
  toOver.words();
  
  if(toGame.clicked){
    mode = game;
  }
  if(toOver.clicked){
   mode = gameover; 
  }
}


void pauseClicks() {

}
