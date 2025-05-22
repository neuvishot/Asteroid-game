import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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

PImage cat, squire, hamp, shields, heart, nul;

// fonts
PFont jack, sun;

// buttons
button startbutton, toPause, toGame, toStart, toOver, ptoOver;
boolean yesClicked;

Minim minimmol;
AudioPlayer music, success, fail, ingame, wins;

// vecotrs:
//PVector loc, vel, gravity;
PImage ufo;
Spaceship player;

// list of bullets
ArrayList<GameObject> objects;

// soore and aesthetics
int score, highscore;
boolean win;


void setup() {
  // images -----------------------------------------------------------
  imageMode(CENTER);
  cat = loadImage("cat.png");
  squire = loadImage("squirrel.png");
  hamp = loadImage("hampster.png");
  shields = loadImage("shield.png");
  heart = loadImage("lives.png");
  ufo = loadImage("ufo.png");
  nul = loadImage("restart.jpg");
  win = false;

  // img end -----------------------------------------------------------------

  // audio
  minimmol = new Minim(this);
  music = minimmol.loadFile("start.mp3");
  ingame = minimmol.loadFile("upbeat.mp3");
  success = minimmol.loadFile("gun.mp3");
  fail = minimmol.loadFile("FAILURE.wav");
  wins = minimmol.loadFile("end.mp3");

  // font
  jack = createFont("Jack Sphinx.ttf", 50);
  sun = createFont("Sunroof & Summer.ttf", 50);

  objInstantiate();

  //objects.add(new rocks());
  //objects.add(new rocks());

  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  score = highscore = 0;
  //loc = new PVector(width/2, height/2);
  //vel = new PVector(5, 0);
  //vel.rotate(random(0, 2*PI));
  //gravity = new PVector(0, 1);

  size(600, 600);

  // change starting room --------------------------------------------------------------
  mode = starts;
  // ------------------------------------------------------------------------------------

  Start_instantiates();
  pause_button_instantiate();
  game_button_instantiate();
  gameover_button_instantiate();

  // still needs to be improved
}
void objInstantiate() {
  if (score > highscore) highscore = score;
  objects = new ArrayList();
  player = new Spaceship();
  objects.add(player);
  objects.add(new rocks());
  objects.add(new rocks());
  objects.add(new rocks());
  objects.add(new rocks());
  objects.add(new badShip());
  objects.add(new power());
  score = 0;
  win = false;
 
  ingame.rewind();
}


void draw() {
  println(mouseX, mouseY);
  //println(objects.size());


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
