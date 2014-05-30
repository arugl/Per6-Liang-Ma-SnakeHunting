Gun bigGun;
Snake splitSnake;

void setup(){
  size(500,575);
  background(color(112,78,209));
  bigGun = new Gun();
  splitSnake = new Snake();
}

void draw(){
  background(color(112,78,209));
  bigGun.display();
}

void keyPressed(){
 if(key == ' '){
   bigGun.move();
 } 
}

class Bullet{
 color c;
 float xspeed;
 float yspeed;
 Bullet(){
  c = color(162);
 } 
 void display(){
    stroke(145);
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
   xspeed = 5;
   xpos = 5;
   ypos = 560;
 }
 void display(){
    stroke(60);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 30);
 }
 
 void move(){
   xpos = xpos + xspeed;
   if(xpos >= width){
     xpos = 5;
   } 
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
