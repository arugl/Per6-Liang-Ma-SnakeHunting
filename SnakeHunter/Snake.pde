import java.util.Random;

class Snake { 
  color col;
  int len;
  float spd;
  ArrayList<Unit> units;

  Snake(int i) {
    this(new ArrayList<Unit>());
  }

  Snake(ArrayList<Unit> units) {
    this.units = units;
    len = units.size();
    spd = 5;
    Random rand = new Random(255);
    col = color(rand.nextInt(), rand.nextInt(), rand.nextInt());
    for (Unit n : units) {
      n.setColor(col);
    }
  }

  void display() {
    noStroke();
    fill(col);
    rectMode(CENTER);
    //rect(xpos, ypos, 30, 50);
  }
}
