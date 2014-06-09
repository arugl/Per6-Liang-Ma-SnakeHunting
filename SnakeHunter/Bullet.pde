public class Bullet { //STORED IN REAL-VALUE XYCORS
  int xcor, ycor;
  color backgroundColor = color(122, 78, 209);
  int spd; //you only need one- vertical
  color col = color(62);

  //Bullet() { } //?

  Bullet(int xcor, int ycor) {
    spd = 1;
    this.xcor = xcor / 10; //Had problems with the gun having whole coords and creating bullets with its coords mult. by 10
    this.ycor = ycor / 10;
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

