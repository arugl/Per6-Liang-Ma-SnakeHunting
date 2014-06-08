class Unit {
  int dir; //1 = north; 2 = east; 3 = south; 4 = west
  //int val;
  int xcor, ycor;
  color col;
  color backgroundColor = color(122, 78, 209);
  Unit prev;

  Unit(int xcor, int ycor, color col) {
    //this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
    this.col = col; //each snake will have a random color for all of its units
    prev = null;
  }

  Unit(int xcor, int ycor, color col, Unit prev) {
    //this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
    this.col = col;
    this.prev = prev;
  }

  void display() {
    stroke(#FFFFFF);
    fill(col);
    rectMode(CENTER);
    rect(xcor*10, ycor*10, 10, 10);
  }

  void die() {
    rectMode(CENTER);
    stroke(backgroundColor);
    fill(backgroundColor);
    rect(xcor*10, ycor*10, 10, 10);
  }

  void setColor(color col) { 
    this.col = col;
  }

  void setDir(int dir) { 
    this.dir = dir;
  }
  void setPrev(Unit prev) { 
    this.prev = prev;
  }

  int getDir() { 
    return dir;
  }
  
  Unit getPrev() { 
    return prev;
  }

  int getXcor() { 
    return xcor;
  }
  int getYcor() { 
    return ycor;
  }

  void setXcor(int xcor) { 
    this.xcor = xcor;
  }
  void setYcor(int ycor) { 
    this.ycor = ycor;
  }
}

