import java.util.Random;
import java.util.ArrayList;

class Snake { 
  color col;
  float spd;
  ArrayList<Unit> units;
  //int len //removed- useless, units.size() is linear anyway

  Snake() { //first-run constructor
    len = 5;
    spd = 5;
    units = new ArrayList();
    
    float xcor = height/2;
    float ycor = width/2;
    Random rand = new Random(255);
    col = color(rand.nextInt(), rand.nextInt(), rand.nextInt());
    
    units.add(new Unit(2,xcor,ycor,col); //first unit has no next
    
    for(int i=1;i<units.size();i++){
      xcor += 10;
      ycor += 10;
      units.add(new Unit(2,xcor,ycor,col,units.get(i=1));
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

 void move(){
   
   for(int i=units.size()-1;i>=0;i--){
     units.get(i).setX(units.get(i-1).getX());
     units.get(i).setY(units.get(i-1).getY());
   }
    
   int dir = units(0).getDir();
   switch(dir){
     case 1: units(0).setY(units(0).getY() + 10);
     case 2: units(0).setX(units(0).getX() + 10);
     case 3: units(0).setY(units(0).getY() - 10);
     case 4: units(0).setX(units(0).getX() - 10);
   }
   
   units(0).setX(units(0).getX() % width);
   units(0).setY(units(0).getY() % height);

 }      

  //Snake(int i) { ???
  //  this(new ArrayList<Unit>());
  //}

  void display() {
    for (Unit u : units) {
      u.display();
    }
  }
  
  ArrayList<Unit> getUnits(){
   return units; 
  }
  
}

