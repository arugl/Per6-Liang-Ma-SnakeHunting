class Gun {
  color col;
  float xcor;
  float ycor;
  float xspeed;
  float yspeed;
  float getXcor() {
    return xcor;
  }
  float getYcor() {
    return ycor;
  }
  Gun() {
    col = color(209);
    xspeed = 10;
    xcor = 255;
    ycor = 560;
  }
  void display() {
    stroke(60);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 30);
  }

  void moveLeft() {
    xcor = xcor - xspeed;
    if (xcor < 5) {
      xcor = width - 5;
    }
  }
  
  void moveRight() {
    xcor = xcor + xspeed;
    if (xcor >= width) {
      xcor = 5;
    }
  }
  
  /*void shoot(Bullet bigBullet) {
    bigBullet = new Bullet(xcor, ycor - 100);
  }*/
  
}
