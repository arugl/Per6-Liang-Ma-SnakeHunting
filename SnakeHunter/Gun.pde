class Gun {
  color col = color(209);
  color gunBackgroundColor = color(0);
  int xcor, ycor;
  int xspeed, yspeed;

  Gun() {
    xspeed = 10;
<<<<<<< HEAD
    xcor = 310;
=======
    xcor = 310; //Changed to 310 to align with bullets, snakes, meaning tiles.
>>>>>>> bf45866d191ad55b9330e6b02293f2e5091ba4ae
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
<<<<<<< HEAD
    if (xcor < 0) {
      xcor = width-10;
=======
    if (xcor < 10) {
      xcor = width - 10;
>>>>>>> bf45866d191ad55b9330e6b02293f2e5091ba4ae
    }
  }

  void moveRight() {
    die();
    xcor = xcor + xspeed;
<<<<<<< HEAD
    if (xcor > width) {
      xcor = 0;
      display();
=======
    if (xcor > width - 10) {
      xcor = 10;
>>>>>>> bf45866d191ad55b9330e6b02293f2e5091ba4ae
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
