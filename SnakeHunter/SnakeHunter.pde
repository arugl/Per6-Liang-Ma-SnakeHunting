import java.util.ArrayList;

int lastTime = 0;
color c;
Gun bigGun; 
ArrayList<Snake> snakes;
ArrayList<Bullet> bullets;

void setup() {
  lastTime = millis();
  size(500, 575);
  background(color(112, 78, 209));
  bigGun = new Gun(); //we can add new attributes to the gun later but for now, this is OK
  snakes = new ArrayList<Snake>();
  bullets = new ArrayList<Bullet>();
  snakes.add(new Snake(5));
}

void draw() {
  background(color(193, 171, 82));
  noStroke();
  fill(0);
  rect(250, 537.5, 500, 75);
  bigGun.display();
  int bSize = bullets.size();
  for (int i = 0; i < bSize; i++) {
    if (bullets.get(i).getYpos() <= 0) {
      bullets.remove(i);
      bSize = bullets.size();
    }
  }
  for (Bullet b : bullets) {
    if (b != null) {
      b.flying();
      b.display();
    }
  }
}

void keyPressed() {
  if (key == 'd') {
    bigGun.moveRight();
    bigGun.display();
  } else if (key == 'a') {
    bigGun.moveLeft();
    bigGun.display();
  } else if (key == ' ') {
    if (millis() - lastTime >= 450) {
      Bullet bigBullet = new Bullet(bigGun.getXpos(), bigGun.getYpos() - 15);
      bullets.add(bigBullet);
      bigGun.shoot(bigBullet);
      lastTime = millis();
    }
  }
}
