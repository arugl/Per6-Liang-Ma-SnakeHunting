Gun bigGun;
Snake splitSnake;
ArrayList<Snake> splitSnakes;
ArrayList<Bullet> shotBullets;

void setup(){
  size(500,575);
  background(color(112,78,209));
  //To be seen if it improves gameplay.
  //frameRate(90);
  shotBullets = new ArrayList<Bullet>();
  bigGun = new Gun();
  splitSnake = new Snake();
}

void draw(){
  background(color(112,78,209));
  bigGun.display();
  for(Bullet b : shotBullets){
    b.flying();
    b.dispaly();
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

class Bullet{
 color c;
 float xpos;
 float ypos;
 float xspeed;
 float yspeed;
 Bullet(){
  c = color(162);
  yspeed = 5;
  xpos = newXpos;
  ypos = newYpos;
 } 
 void display(){
    stroke(145);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 10);
 }
}

class Gun{
 color c;
 float xpos;
 float ypos;
 float xspeed;
 float yspeed;
 Gun(){
   c = color(50);
   xspeed = 10;
   xpos = 5;
   ypos = 560;
 }
 void display(){
    stroke(60);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 30);
 }
 
 void moveLeft(){
   xpos = xpos - xspeed;
   if(xpos < 5){
     xpos = width - 5;
   } 
 }
 
 void moveRight(){
   xpos = xpos + xspeed;
   if(xpos >= width){
     xpos = 5;
   } 
 }
 
 void shoot(){
   shotBullets.add(new Bullet(xpos, ypos - 15));
 }
}
 
class Snake{
  color c;
  float xspeed;
  float yspeed;
  Snake(){
    c = color(42,160,43);
  }
  void display(){
    stroke(color(15,124,16));
  }
}
