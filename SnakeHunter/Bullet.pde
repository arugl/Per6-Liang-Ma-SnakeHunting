public class Bullet { //STORED IN REAL-VALUE XYCORS
  int xcor, ycor;
  color backgroundColor = color(122, 78, 209);
  int spd; //you only need one- vertical
  color col = color(62);

  //Bullet() { } //?

  Bullet(int xcor, int ycor) {
    spd = 10;
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
    die();
    ycor -= spd;
  }

  void die() {
    rectMode(CENTER);
    stroke(backgroundColor);
    fill(backgroundColor);
    rect(xcor, ycor, 10, 10);
  }

  int getXcor() { 
    return xcor/10;
  }
  int getYcor() { 
    return ycor/10;
  }
  
}

