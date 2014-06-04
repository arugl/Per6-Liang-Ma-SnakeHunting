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
  snakes.add(new Snake());
}

void draw() {
  background(color(193, 171, 82));
  noStroke();
  fill(0);
  rect(250, 537.5, 500, 75);
  bigGun.display();
  int bSize = bullets.size();
  for (int i = 0; i < bSize; i++) {
    if (bullets.get(i).getYcor() <= 0) {
      bullets.remove(i);
      bSize = bullets.size();
    }
  }
  for (Bullet b : bullets) {
    b.flying();
    b.display();
  }
  /*
  for (int i = 0; i < bullets.size(); i++) {
   b.flying();
   b.display();
   for (int x = 0; x < snakes.size(); x++) {
   for (int y = 0; y < snakes.)) {
   if (Math.abs(u.getXcor() - bullets[i].getXcor()) <= 5 && u.getYcor() - bullets[i].getYcor() <= 5) {
   bullets.remove(bullets[i]);
   s.getUnits().remove(u);
   }
   }
   }
   }
   */
  for (Snake s : snakes) {
    s.display();
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
      Bullet bigBullet = new Bullet(bigGun.getXcor(), bigGun.getYcor() - 20);
      bullets.add(bigBullet);
      //bigGun.shoot(bigBullet);
      lastTime = millis();
    }
  }
}

