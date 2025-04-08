void keyPressed() {
  if (keyCode == UP|| key == 'w' || key == 'W') upkey = true;
  if (keyCode == DOWN|| key == 's' || key == 'S') downkey = true;
  if (keyCode == LEFT|| key == 'a' || key == 'A') leftkey = true;
  if (keyCode == RIGHT|| key == 'd' || key == 'D') rightkey = true;
}

void keyReleased() {
  if (keyCode == UP || key == 'w' || key == 'W') upkey = false;
  if (keyCode == DOWN|| key == 's' || key == 'S') downkey = false;
  if (keyCode == LEFT|| key == 'a' || key == 'A') leftkey = false;
  if (keyCode == RIGHT|| key == 'd' || key == 'D') rightkey = false;
}
