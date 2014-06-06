import java.util.ArrayList;

int bulletTime = 0;
int moveTime = 0;

color backgroundColor = color(122, 78, 209);

ArrayList<Snake> snakes = new ArrayList<Snake>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

Gun bigGun = new Gun();
FoodPellet food;

boolean isFoodHere = false; //Are there any food pellets on the map?

void setup() {
  bulletTime = millis();
  moveTime = millis();
  size(500, 610);
  background(backgroundColor);
  snakes.add(new Snake(5));
}

void draw() {

  noStroke();
  fill(0);
  rectMode(CORNERS);
  rect(0, height - 35, width, height);

  if (!isFoodHere) {
    newFoodPellet();
  }

  bigGun.display();

  checkBullet();

  bulletMovement();

  snakeMovement();

  food.display();
}

void snakeMovement() {
  for (int i = 0; i < snakes.size (); i++) {
    Snake snake = snakes.get(i);
    if (millis() - moveTime >= 500) {
      snake.move();
      moveTime = millis();
    }
    snake.display();
  }
}

void bulletMovement() {
  for (int i = 0; i < bullets.size (); i++) {
    if (bullets.get(i).getYcor() < 0) {
      bullets.remove(i);
    } else {
      bullets.get(i).flying();
      bullets.get(i).display();
    }
  }
}

void newFoodPellet() {
  int randXcor = (int) random(0, height-35);
  int randYcor = (int) random(0, width);
  randXcor = ((randXcor / 10) * 10) - 5;
  if (randXcor < 0) randXcor += width;
  randYcor = ((randYcor / 10) * 10) - 5;
  if (randYcor < 0) randYcor += height - 40;
  while (checkForSnakes (randXcor, randYcor)) {
    randXcor = (int) random(0, height-35);
    randYcor = (int) random(0, width);
  }

  food = new FoodPellet(randXcor, randYcor);
  isFoodHere = true;
}

void checkBullet() { //checks for collisions
  for (int i = 0; i < snakes.size (); i++) {
    Snake snake = snakes.get(i);
    for (int j = 0; j < snake.getUnits ().size(); j++) {
      Unit unit = snake.getUnits().get(j);
      for (int k = 0; k < bullets.size (); k++) {
        Bullet b = bullets.get(k);
        if (b.getXcor() == unit.getXcor() && b.getYcor() == unit.getYcor()) {
          if (k < bullets.size() && j < snake.getUnits().size()) {
            bullets.get(k).die();
            bullets.remove(k);
            snakes.get(i).getUnits().get(j).die();
            snakes.get(i).getUnits().remove(j);
          }
        }
      }
    }
  }
}

boolean checkForSnakes(int xcor, int ycor) {//Checks to see if the xcor and ycor happens to be where a snake unit is at
  for (int i = 0; i < snakes.size (); i++) {
    Snake snake = snakes.get(i);
    for (int j = 0; j < snake.getUnits ().size(); j++) {
      Unit unit = snake.getUnits().get(j);
      if (unit.getXcor() == xcor && unit.getYcor() == ycor) {
        return true;
      }
    }
  }
  return false;
}

void keyPressed() {
  if (key == CODED || key == 'a' || key == 'd') {
    if (keyCode == RIGHT || key == 'd') {
      bigGun.moveRight();
      bigGun.display();
    } else if (keyCode == LEFT || key == 'a') {
      bigGun.moveLeft();
      bigGun.display();
    }
  } else if (key == ' ') {
    if (millis() - bulletTime >= 250) {
      Bullet bigBullet = new Bullet(bigGun.getXcor(), bigGun.getYcor() - 20);
      bullets.add(bigBullet);
      bulletTime = millis();
    }
  }
}

