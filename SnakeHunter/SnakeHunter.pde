import java.util.ArrayList;

class SnakeHunter {

  Gun bigGun; 
  ArrayList<Snake> snakes;
  ArrayList<Bullet> bullets;

void setup(){
  size(500,575);
  background(color(112,78,209));
  bigGun = new Gun(); //we can add new attributes to the gun later but for now, this is OK
  snakes.add(new Snake(5));
}

void draw(){
  background(color(112,78,209));
  bigGun.display();
  if(bigBullet != null){
    bigBullet.flying();
    bigBullet.display();
  }
}

void keyPressed(){
 if(key == 'd'){
    bigGun.moveRight();
    bigGun.display();
  } else if(key == 'a'){
    bigGun.moveLeft();
    bigGun.display();
  } else if(key == ' '){
    bigGun.shoot(); 
  }
}


