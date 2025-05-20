void gameover_button_instantiate() {
  toStart = new button(200, height - 100, 250, 50, white, black, "Click to Restart", ".pic");
  sad = new gifs("gameover/frame_", "_delay-0.03s.gif", 33, 3, width/2+50, height/2, width+400, height);
}
gifs sad;

void gameover() {
  if (!win) {
    fill(0);
    textFont(jack);

    sad.act();
    sad.show();
    image(cat, 520, 380, 150, 150);
    image(squire, 575, 430, 100, 100);
    image(hamp, 520, 470, 70, 70);
    textSize(40);
    fill(#F3FC8A);
    noStroke();
    rect(width/2, 60, 700, 60);
    fill(255);
    rect(width/2, 130, 700, 80);
    stroke(0);
    fill(0);
    text("Score:"+score, width/2, 150);
    text("Highscore:"+highscore, width/2, 120);

    textFont(sun);
    textSize(18);
    text("Universal domination must wait...", width/2, 65);
  } else if (win) {
    fill(255);
    textFont(jack);
    textSize(50);
    image(nul, width/2+100, height/2, width+300, height);
    text("We have conquered the stars!", width/2, 60);
    textSize(40);
    text("Score:"+score, width/2+150, 150);
    text("Highscore:"+highscore, width/2+150, 120);
    image(heart, width - 120, height - 100, 150, 150);
    textFont(sun);
  }


  toStart.size = 15;
  toStart.show();
  toStart.clicked();
  toStart.words();


  if (toStart.clicked) {
    mode = starts;
  }
}

void gameoverClicks() {
}
