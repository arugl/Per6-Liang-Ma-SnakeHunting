class Tile {
  
  int xcor, ycor;
  int fVal, gVal; //used for A*
  boolean inList; //used for A*
  Tile parent; //used for A*
  boolean hasSnake, hasBullet, hasFood;
  Unit unit, Bullet bullet, Food food;
  
  //color col;  //default color = color(122, 78, 209);
  
  Tile(int xcor, int ycor) {
    this.xcor = xcor;
    this.ycor = ycor;
    hasSnake = false;
    inList = false;
  }

  void changeSnake(boolean boo) { hasSnake = boo; }
  void changeFood(boolean boo) { hasFood = boo; }
  void changeBullet(boolean boo) { hasBullet = boo; }
  void changeList(boolean boo) { inList = boo; } //A*
  
  void setFval(int fVal){ this.fVal = fVal; } //A*
  void setGval(int gVal){ this.gVal = gVal; } //A*
  void setParent(Tile parent){ this.parent = parent; } //A*
  
  int getXcor () { return xcor; }
  int getYcor () { return ycor; }
  
  boolean isSnake() { return hasSnake; }
  boolean isFood() { return hasFood; }
  boolean isBullet() { return hasBullet; }
  boolean isList() { return inList; } //A*
  
  Bullet getBullet() { return bullet; }
  Food getFood() { return food; }
  Unit getUnit() { return unit; }
  int getFval() { return fVal; } //A*
  int getGval() { return gVal; } //A*
  
  boolean equals(Tile n){ //override equals method
    if(xcor == n.getXcor() && ycor == n.getYcor()){
      return true;
    } else {
      return false;
    }
  }
  
  void setUnit(Unit unit){ this.unit = unit; } //lol i don't think we need this
  void setFood(Food food){ this.food = food; } 
  void setBullet(Bullet bullet){ this.bullet = bullet; 
   
}
  
