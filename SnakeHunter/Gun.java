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
   bigBullet = new Bullet(xpos, ypos - 15);
}
 

