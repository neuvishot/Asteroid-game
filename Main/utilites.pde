class gifs { //  start gif class --------------------------------------------------------------------------------------

  float x, y, s, w, h;
  int n, flip;
  String t1, t2;
  PImage[] giff;
  // flip = flipping through frames
  // n = number of frames
  // giff = array to load everything and index to flip through

  gifs(String tt1, String tt2, int numberOfFrames, float speed, float xx, float yy, float ww, float hh) {
    x = xx;
    y = yy;
    s = speed;
    w = ww;
    h = hh;


    // for loading images
    n = numberOfFrames;
    t1 = tt1;
    t2 = tt2;
    giff = new PImage[n];
    int frameLoad = 0;
    while (frameLoad < n) {
      giff[frameLoad] = loadImage(tt1+frameLoad+tt2);
      frameLoad++;
    }
  }

  void show() {
    pushMatrix();
    imageMode(CENTER);
    image(giff[flip], x, y, w, h);

    popMatrix();
  }

  void act() {
    if (frameCount % s == 0) flip++;
    if (flip == n) {
      flip = 0;
    }
  }
}
// end gif class -------------------------------------------------------------------------------


// all button related ================================================================================================

// global variables for the classes
boolean mouseReleased, wasPressed;

// put this click(); in the top of the draw function
void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}


class button { // -------------------------------------------------------------------------------------------------

  float x, y, w, h;
  color norm, high;
  String text, pic;
  boolean clicked;
  PImage photo;
  float size;
  // copy and paste and fill:
  // button(x, y, w, h, normcol, highcol, xxx, "text", ".pic");

  // parameters for buttons, x, y, w, h, normal color, highlight, text display
  button(float xx, float yy, float ww, float hh, color norms, color highs, String Text, String pics) {
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    size = w/4;
    norm = norms;
    high = highs;
    text = Text;
    fill(norm);
    pic = pics;
  }

  void words() {
    textAlign(CENTER, CENTER);
    textSize(size);
    if (touchMouse()) {
      fill(255);
    } else {
      fill(0);
    }
    text(text, x, y);
  }

  void pics() {
    imageMode(CENTER);
    photo = loadImage(pic);
    image(photo, x, y, w/2, h/2);

    if (pic == null) {
      println("no pic");
    }
  }


  boolean touchMouse() {
    if (mouseX > x-w/2 && mouseX < x + w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }

  void clicked() {
    if (mouseReleased && touchMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  void show() {
    rectMode(CENTER);
    if (touchMouse()) {
      fill(high);
      stroke(255);
    } else {
      fill(norm);
      stroke(0);
    }
    strokeWeight(3);
    rect(x, y, w, h, h/6);
  }
}
