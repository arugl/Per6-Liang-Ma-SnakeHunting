class Tile {

  int xcor, ycor;
  int fVal, gVal, hVal; //used for A*
  int inList; //used for A* //-1 closed, 0 not, 1 open
  Tile parent; //used for A*
  boolean hasSnake, hasBullet, hasFood;
  Unit unit;
  Bullet bullet;
  FoodPellet food;

  //color col;  //default color = color(122, 78, 209);

  Tile(int xcor, int ycor) {
    this.xcor = xcor;
    this.ycor = ycor;
    hasSnake = false;
    inList = 0;
    fVal = -1; //no fVal
    gVal = -1; //no gVal
    hVal = -1; //no hVal
    //inList = 0; //not in list
  }

  void changeSnake(boolean boo) { 
    hasSnake = boo;
  }
  void changeFood(boolean boo) { 
    hasFood = boo;
  }
  void changeBullet(boolean boo) { 
    hasBullet = boo;
  }
  void changeList(int num) { 
    inList = num;
  } //A*

  void setFval(int fVal) { 
    this.fVal = fVal;
  } //A*
  void setGval(int gVal) { 
    this.gVal = gVal;
  } //A*
  void setHval(int hVal) { 
    this.hVal = hVal;
  } //A*
  void setParent(Tile parent) { 
    this.parent = parent;
  } //A*

  int getXcor () { 
    return xcor;
  }
  int getYcor () { 
    return ycor;
  }

  boolean isSnake() { 
    return hasSnake;
  }
  boolean isFood() { 
    return hasFood;
  }
  boolean isBullet() { 
    return hasBullet;
  }
  int isList() { 
    return inList;
  } //A*

  Bullet getBullet() { 
    return bullet;
  }
  FoodPellet getFood() { 
    return food;
  }
  Unit getUnit() { 
    return unit;
  }
  int getFval() { 
    return fVal;
  } //A*
  int getGval() { 
    return gVal;
  } //A*
  int getHval() { 
    return hVal;
  } //A*
  Tile getParent() { 
    return parent;
  }

  boolean equals(Tile n) { //override equals method
    if (xcor == n.getXcor() && ycor == n.getYcor()) {
      return true;
    } else {
      return false;
    }
  }

  String toString(){
    //return "[" + xcor + ":" + ycor + "]"; //, FVAL=" + fVal + ", GVAL=" + gVal + ", HVAL=" + hVal + "]";'
    String retStr = "";
    retStr += "[" + xcor + ":" + ycor + " to ";
    if(parent == null){
      retStr += "NO_PARENT]";
    }
    else{
      retStr+= parent.getXcor() + ":" + parent.getYcor() + "]";
    }
    return retStr;
  }
  

  void setUnit(Unit unit) { 
    this.unit = unit;
  } //lol i don't think we need this
  void setFood(FoodPellet food) { 
    this.food = food;
  } 
  void setBullet(Bullet bullet) { 
    this.bullet = bullet;
  }
}
