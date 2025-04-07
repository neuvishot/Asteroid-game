void gameover_button_instantiate() {
  toStart = new button(width - 100, height - 100, 75, 75, white, black, "text", ".pic");
}

void gameover() {
  background(red);
  toStart.show();
  toStart.clicked();
  
  if (toStart.clicked){
   mode = starts; 
    
  }
  
}

void gameoverClicks() {
}
