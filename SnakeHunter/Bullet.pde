class Bullet {
  float xcor, ycor;
  float spd; //you only need one- vertical
  color col = color(62);
  
  //Bullet() { } //?
  
  Bullet(float xcor, float ycor) {
    yspeed = 10;
    this.xcor = xcor;
    this.ycor = ycor;
  }
  
  void display() {
    stroke(255);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 10);
  }
  
  void flying() {
    ycor -= spd;
  }
  
  float getXcor() { return xcor; }
  float getYcor() { return ycor; }
   
}
