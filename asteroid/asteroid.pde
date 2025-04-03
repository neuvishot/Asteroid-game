// this ones empty

int mode;
final int starts = 1;
final int game = 2;
final int gameover = 3;
final int pause = 4;

color red = #E32727;
color yellow = #FFE517;
color black = #000000;
color white = #FFFFFF;

// buttons
 button startbutton, gamebut, pausebut, gameoverbut, toOver;

void setup() {
  size(600, 600);
  mode = starts;
  start_button_instantiate();
  pause_button_instantiate();
  game_button_instantiate();
  gameover_button_instantiate();
  
  // still needs to be improved
  toOver = new button(100, height-100, 75, 75, red, black, gameover, "gameover", ".png");
}

void draw() {
  println(mouseX, mouseY);
  //println(decide, randomWord, randomColor);
  if (mode == starts) {
    starts();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == pause) {
    pause();
  }
}

void mousePressed() {
  if (mode == starts) {
    startClicks();
  } else if (mode == game) {
    gameClicks();
  } else if (mode == gameover) {
    gameoverClicks();
  } else if (mode == pause){
    pauseClicks();
  }
}
