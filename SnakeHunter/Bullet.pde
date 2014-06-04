class Bullet {
  float xcor;
  float ycor;
  float xspeed;
  float yspeed;
  color col;
  
  Bullet() {
  }
  Bullet(float newXcor, float newYcor) {
    col = color(62);
    yspeed = 10;
    xcor = newXcor;
    ycor = newYcor;
  } 
  void display() {
    stroke(255);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 10);
  }
  void flying() {
    ycor = ycor - yspeed;
  }
  
  float getXcor() {
    return xcor;
  }
  float getYcor() {
    return ycor;
  }
}
