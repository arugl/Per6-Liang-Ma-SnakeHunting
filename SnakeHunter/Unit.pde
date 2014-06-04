class Unit {
  int dir; //1 = north; 2 = east; 3 = south; 4 = west
  int val;
  float xcor, ycor;
  color col;
  
  Unit() {
    dir = 2;
    xcor = 255;
    ycor = 255;
    col = color(45, 173, 46);
  }

  Unit(int dir, float xcor, float ycor, Unit next) {
    this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
  }

  void display() {
    noStroke();
    fill(color(45, 173, 46));
    rectMode(CENTER);
    rect(xcor, ycor, 10, 10);
  }

  void setColor(color col) {
    this.col = col;
  }

  void setDir(int dir) {
    this.dir = dir;
  }

  int getDir() {
    return dir;
  }
  
  float getXcor(){
    return xcor;
  }
  
  float getYcor(){
    return ycor;
  }

}

