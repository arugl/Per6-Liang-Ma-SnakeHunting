class Gun {
  color col = color(209);
  color gunBackgroundColor = color(0);
  float xcor, ycor;
  float xspeed, yspeed;

  Gun() {
    xspeed = 10;
    xcor = 305;
    ycor = 590;
  }
  
  void display() {
    stroke(60);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 30);
  }

  void moveLeft() {
    die();
    xcor = xcor - xspeed;
    if (xcor < 5){
      xcor = width - 5;
    }
  }
  
  void moveRight() {
    die();
    xcor = xcor + xspeed;
    if (xcor > width - 5) {
      xcor = 5;
    }
  }

  void die(){
    rectMode(CENTER);
    stroke(gunBackgroundColor);
    fill(gunBackgroundColor);
    rect(xcor,ycor,10,30);
  }

  float getXcor() { return xcor; }
  float getYcor() { return ycor; }  
  
}
