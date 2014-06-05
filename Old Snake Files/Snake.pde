import java.util.Random;

class Snake { 
  color col = color(45, 173, 46);
  int len;
  float spd;
  ArrayList<Unit> units;

  Snake() {
    len = 1;
    spd = 5;
    units = new ArrayList();
    units.add(new Unit());
  }

  Snake(int i) {
    this(new ArrayList<Unit>());
  }

  Snake(ArrayList<Unit> units) {
    this.units = units;
    len = units.size();
    spd = 5;
    //Random rand = new Random(255);
    //col = color(rand.nextInt(), rand.nextInt(), rand.nextInt());
    for (Unit n : units) {
      n.setColor(col);
    }
  }

  void display() {
    for (Unit u : units) {
      u.display();
    }
  }
  
  ArrayList<Unit> getUnits(){
   return units; 
  }
}

