class Gun {
  color col = color(209);
  color gunBackgroundColor = color(0);
  int xcor, ycor;
  int xspeed, yspeed;

  Gun() {
    xspeed = 10;
    xcor = 310;
    ycor = 620;
  }

  void display() {
    stroke(60);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 30); //+5?
  }

  void moveLeft() {
    die();
    xcor = xcor - xspeed;
    if (xcor < 0) {
      xcor = width-10;
    }
  }

  void moveRight() {
    die();
    xcor = xcor + xspeed;
    if (xcor > width) {
      xcor = 0;
      display();
    }
  }

  void die() {
    rectMode(CENTER);
    stroke(gunBackgroundColor);
    fill(gunBackgroundColor);
    rect(xcor, ycor, 10, 30);
  }

  int getXcor() { 
    return xcor;
  }
  int getYcor() { 
    return ycor;
  }
}
