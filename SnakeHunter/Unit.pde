class Unit {
  int dir; //1 = north; 2 = east; 3 = south; 4 = west
  int val;
  float xcor, ycor;
  color col;
  Unit prev; //changed from next
  
  Unit(int dir, float xcor, float ycor, color col) {
    this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
    this.col = col; //each snake will have a random color for all of its units
    prev = null;
    
    //xcor = 255;
    //ycor = 255;
    //col = color(45, 173, 46);
  }

  Unit(int dir, float xcor, float ycor, color col, Unit prev) {
    this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
    this.col = col;
    this.prev = prev;
  }

  void display() {
    noStroke();
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 10);
  }

  void setColor(color col) {
    this.col = col;
  }

  void setDir(int dir) {
    this.dir = dir;
  }
  
  void setPrev(Unit prev){
    this.prev = prev;
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
  
  Unit getPrev(){
    return prev;
  }

}

