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


