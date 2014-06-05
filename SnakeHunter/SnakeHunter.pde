import java.util.ArrayList;

int lastTime = 0;
//color c; each snake has individual color??
ArrayList<Snake> snakes = new ArrayList<Snake>(); //moved it up here
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Gun bigGun = new Gun(); 

void setup() {
  lastTime = millis();
  size(500, 575);
  background(color(112, 78, 209));
  bigGun = new Gun(); //we can add new attributes to the gun later but for now, this is OK
  snakes.add(new Snake(5));
}

void draw() {
  //background(color(193, 171, 82)); //Why change this?
  noStroke();
  fill(0);
  rectMode(CORNERS);
  rect(0,height-30,width,height); //better than //rect(250, 537.5, 500, 75);
  
  bigGun.display();
  
  for (int i=0;i<bullets.size();i++) {
    if(bullets.get(i).getYcor() < 0){
      bullets.remove(i);
    }
    else {
      bullets.get(i).flying();
      bullets.get(i).display();
    }
  }
 
  for (Snake s : snakes) {
    s.display();
  }
  
}


void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT){
      bigGun.moveRight();
      bigGun.display();
    }
    else if (keyCode == LEFT){
      bigGun.moveLeft();
      bigGun.display();
    }
  }
  else if (key == ' ') {
    if (millis() - lastTime >= 450) {
      Bullet bigBullet = new Bullet(bigGun.getXcor(), bigGun.getYcor() - 20);
      bullets.add(bigBullet);
      lastTime = millis();
    }
  }
}

