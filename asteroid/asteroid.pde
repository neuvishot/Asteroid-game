import java.util.ArrayList;

int mode;
final int starts = 1;
final int game = 2;
final int gameover = 3;
final int pause = 4;

color red = #E32727;
color yellow = #FFE517;
color black = #000000;
color white = #FFFFFF;

// keys
boolean upkey, downkey, leftkey, rightkey, spacekey;

// buttons
button startbutton, toPause, toGame, toStart, toOver;
boolean yesClicked;

// vecotrs:
//PVector loc, vel, gravity;

Spaceship player;

// list of bullets
ArrayList<bullet> bullets;


void setup() {

  player = new Spaceship();
  bullets = new ArrayList();

  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  //loc = new PVector(width/2, height/2);
  //vel = new PVector(5, 0);
  //vel.rotate(random(0, 2*PI));
  //gravity = new PVector(0, 1);

  size(600, 600);
  mode = game;
  start_button_instantiate();
  pause_button_instantiate();
  game_button_instantiate();
  gameover_button_instantiate();

  // still needs to be improved
}

void draw() {
  //println(mouseX, mouseY);
  click();
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
  } else if (mode == pause) {
    pauseClicks();
  }
}
