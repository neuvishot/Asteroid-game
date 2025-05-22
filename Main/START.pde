void Start_instantiates() { // to lessen tab jumping
  startbutton = new button(width/2-50, height/2+100, 200, 75, #5DAFFF, #FFDC29, "to game", ".png");
  start = new gifs("start/frame_", "_delay-0.03s.gif", 13, 3, width/2+90, height/2, width+500, height);
}
// global
gifs start;

void starts() {
  wins.pause();
  wins.rewind();
  music.play();
  background(yellow);
  start.act();
  start.show();
  startbutton.show();
  startbutton.clicked();
  startbutton.words();

  textFont(sun);
  textSize(20);
  fill(#FFE97C);
  text("Pawstars:", 250, 130);
  textSize(45);
  fill(255);
  text("Galactic", 250, 210);
  text("Ops!!!", 250, 290);

  startbutton.size = 20;
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
    music.pause();
    //objects.add(new rocks());
    //objects.add(new rocks());
  }
}

void startClicks() {
}
