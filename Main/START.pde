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
  
  fill(0);
  textSize(100);
  textFont(jack);
  text("Get rid of the opps!", width/2, height/2);
  
  circle(100, 100, 100);
  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.lives = 0;
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  if (startbutton.clicked) {
    mode = game;
    objInstantiate();
    //objects.add(new rocks());
    //objects.add(new rocks());
  }
}

void startClicks() {
}
