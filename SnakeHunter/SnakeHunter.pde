import java.util.ArrayList;

int lastTime = 0;
color backgroundColor = color(122,78,209);
ArrayList<Snake> snakes = new ArrayList<Snake>(); //moved it up here
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Gun bigGun = new Gun(); 

void setup() {
  lastTime = millis();
  size(500, 610);
  background(backgroundColor);
  bigGun = new Gun(); //we can add new attributes to the gun later but for now, this is OK
  snakes.add(new Snake(5));
  
}

void draw() {
  
  noStroke();
  fill(0);
  rectMode(CORNERS);
  rect(0,height-35,width,height);
  
  bigGun.display();

  check();

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

void check(){ //checks for collisions
  for(int i=0;i<snakes.size();i++){
    for(int j=0;j<snakes.get(i).getUnits().size();j++){
      for(int k=0;k<bullets.size();k++){
        if(bullets.get(k).getXcor() == snakes.get(i).getUnits().get(j).getXcor() && bullets.get(k).getYcor() == snakes.get(i).getUnits().get(j).getYcor()){
          bullets.get(k).die();
          bullets.remove(k);
          snakes.get(i).getUnits().get(j).die();
          snakes.get(i).getUnits().remove(j);
        }
      }
    }
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

