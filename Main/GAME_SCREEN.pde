void game_button_instantiate() {
  toPause = new button(width - 50, 50, 50, 50, white, black, "||", ".pic");
  toOver = new button(width/2, height/2+50, 350, 80, red, black, "To above and beyond!", ".png");
  teleport = new button(110, height - 125, 160, 40, yellow, white, "Click to Teleport", ".png");
}

// global d variable
int telpTime; // telpTIme is put to 180 by restart
int d = 100;
boolean areThereAsteroids, activated, actClick;


void game() {
  ingame.play();
  background(black);
  // player, bullets and asteroids ------------------------------------------------
  int i = 0;
  while (i < objects.size()) {
    // get = Get an entry at a particular index.
    // in this case, it is taking the index from the bullet array list, this is so that
    // it can skip from one bullet to the next in a loop
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();

    int trys = 10;
    boolean yay = false;
    float telpx, telpy, finalx, finaly;
    //float safeDistance;

    if (teleport.clicked) {
      telpTime = 180;
      activated = false;

      for (int a = 0; a < trys; a++) {
        telpx = random(width);
        telpy = random(height);
        if (currentObject instanceof rocks) {
          float d = dist(telpx, telpy, currentObject.loc.x, currentObject.loc.y);
          if (d > player.diameter/2 + currentObject.diameter/2) {
            yay = true;
          } else if (d < player.diameter/2 + currentObject.diameter/2) {
            finalx = telpx;
            finaly = telpy;
          }
          if (yay) {
            player.loc.x = finalx;
            player.loc.y = finaly;
            yay = false;
          }
        }
      }
    }


    //if (actClick) {
    //  player.loc.x = random(width);
    //  player.loc.y = random(height);
    //  if (currentObject instanceof rocks) {
    //    if ( dist(player.loc.x, player.loc.y, currentObject.loc.x, currentObject.loc.y) < player.diameter/2 + currentObject.diameter/2) {
    //      player.loc.x = random(width);
    //      player.loc.y = random(height);
    //    }
    //  }
    //}


    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }

    check();
  }

  player.show();
  player.act();

  // buttons ----------------------------------------------------
  toPause.show();
  toPause.clicked();
  toPause.words();
  if (toPause.clicked) {
    mode = pause;
    win = false;
  }


  // behind heart ------------------------
  fill(#FFC036);
  noStroke();
  ellipse(190, 0, 100, 150);
  rectMode(LEFT);
  rect(-5, -5, 190, 75);
  stroke(0);
  rectMode(CENTER);
  int a = 60;
  if (player.lives == 3) {
    image(shields, 50, 40, a, a);
    image(shields, 120, 40, a, a);
    image(shields, 190, 40, a, a);
  } else if (player.lives  == 2) {
    image(shields, 50, 40, a, a);
    image(shields, 120, 40, a, a);
  } else if (player.lives  == 1) {
    image(shields, 50, 40, a, a);
  }

  textFont(sun);
  textSize(20);
  text("Score:"+score, 90, height - 75);
  text("Highscore:"+highscore, 130, height - 35);

  // teleport function --------------------
  teltimer();
  telpTime--;
  if (telpTime <= 0) {
    activated = true;
    telpTime = 0;
  }

  if (activated) {
    // button to teleport here
    teleport.show();
    teleport.clicked();
    teleport.size = 10;
    teleport.words();
  }






  // winning / losing screen-----------------------------
  if (areThereAsteroids == false) {
    fill(255, 50);
    rect(width/2, height/2, width+10, height+10);
    fill(yellow);
    circle(width/2, height/2, 300);


    fill(255);
    noStroke();
    circle(width/2, height/2 -70, 110);
    circle(width/2+80, height/2-30, 77);
    circle(width/2-80, height/2-30, 77);
    image(cat, width/2, height/2 -70, 150, 150);
    image(squire, width/2+80, height/2-30, 100, 100);
    image(hamp, width/2-80, height/2-30, 100, 100);
    stroke(0);
    toOver.size = 16;
    toOver.show();
    toOver.words();
    toOver.clicked();
    if (toOver.clicked) {
      mode = gameover;
      win = true;
    }
  }
}

void gameClicks() {
}



void teltimer() {
  pushMatrix();
  rectMode(CORNER);
  rect(25, height - 150, telpTime, 50);

  popMatrix();
}


void check() {
  int i = 0;
  areThereAsteroids = false;
  while (i < objects.size()) { // whats .size?
    GameObject currentObject = objects.get(i);
    if (currentObject instanceof rocks)
      areThereAsteroids = true;
    i++;
  }
}
