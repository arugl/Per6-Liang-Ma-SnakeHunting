import java.util.Random;
import java.util.ArrayList;

class Snake { 
  color col;
  float spd;
  ArrayList<Unit> units;

  Snake(int len) { //first-run constructor

    spd = 10;
    units = new ArrayList();

    float xcor = height/2;
    float ycor = width/2;

    Random rand = new Random();
    col = color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));

    // unit constructor: Unit(int dir, float xcor, float ycor, color col, Unit prev (opt))
    units.add(new Unit(2, xcor, ycor, col)); //first unit has no prev

    for (int i=1; i<len; i++) {
      xcor += 10;
      units.add(new Unit(2, xcor, ycor, col, units.get(i-1)));
    }
  }  

  Snake(ArrayList<Unit> units) {
    this.units = units;
    spd = 5;
    Random rand = new Random(255);
    col = color(rand.nextInt(), rand.nextInt(), rand.nextInt());
    for (Unit n : units) {
      n.setColor(col);
    }
  }

  void move(int dir) {

    for (int i = units.size () - 1; i > 0; i--) { //alter pos of all units except head
      units.get(i).die();
      units.get(i).setXcor(units.get(i-1).getXcor());
      units.get(i).setYcor(units.get(i-1).getYcor());
    }

    units.get(0).die(); //throw exception later    
    units.get(0).setDir(dir);
    //int dir = units.get(0).getDir();

    switch(dir) {
    case 1: 
      units.get(0).setYcor(units.get(0).getYcor() + 10);
    case 2: 
      units.get(0).setXcor(units.get(0).getXcor() + 10);
    case 3: 
      units.get(0).setYcor(units.get(0).getYcor() - 10);
    case 4: 
      units.get(0).setXcor(units.get(0).getXcor() - 10);
    }
  }

  void display() {
    for (Unit u : units) {
      u.display();
    }
  }

  ArrayList<Unit> getUnits() { 
    return units;
  }
  
}

  /*for(int i=0;i<units.size();i++){
   units.get(i).setXcor(units.get(i).getXcor() % width);
   units.get(i).setYcor(units.get(i).getYcor() % height);
  }*/
