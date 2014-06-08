public class Bullet {
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
    rect(xcor*10, ycor*10, 10, 10);
  }

  void flying() {
    die();
    ycor -= spd;
  }

  void die() {
    rectMode(CENTER);
    stroke(backgroundColor);
    fill(backgroundColor);
    rect(xcor*10, ycor*10, 10, 10);
  }

  int getXcor() { 
    return xcor;
  }
  int getYcor() { 
    return ycor;
  }
}

