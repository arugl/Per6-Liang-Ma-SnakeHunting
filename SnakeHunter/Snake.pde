import java.util.Random;
import java.util.ArrayList;

class Snake { 
  color col;
  int spd;
  ArrayList<Unit> units;

  Snake(int len) { //first-run constructor

    //spd = 10;
    units = new ArrayList<Unit>();

    int xcor = 25;
    int ycor = 30;

    Random rand = new Random();
    col = color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));

    // unit constructor: Unit(int dir, int xcor, int ycor, color col, Unit prev (opt))
    units.add(new Unit(xcor, ycor, col)); //first unit has no prev

    for (int i=1; i<len; i++) {
      xcor++;
      units.add(new Unit(xcor, ycor, col, units.get(i-1)));
    }
  }  

  Snake(ArrayList<Unit> units) {
    this.units = units;
    //spd = 10;
    Random rand = new Random(255);
    col = color(rand.nextInt(), rand.nextInt(), rand.nextInt());
    for (Unit n : units) {
      n.setColor(col);
    }
  }

  void move(int dir) {

    for (int i=units.size()-1; i>0; i--) { //alter pos of all units except head
      get(i).die();
      get(i).setXcor(get(i-1).getXcor());
      get(i).setYcor(get(i-1).getYcor());
    }

    units.get(0).die(); //throw exception later    
    //units.get(0).setDir(dir);
    //int dir = units.get(0).getDir();

    if(dir==1){ 
      units.get(0).setYcor(units.get(0).getYcor() - 1);
    }else if(dir==2){ 
      units.get(0).setXcor(units.get(0).getXcor() + 1);
    }else if(dir==3){ 
      units.get(0).setYcor(units.get(0).getYcor() + 1);
    }else if(dir==4){ 
      units.get(0).setXcor(units.get(0).getXcor() - 1);
    }
  }

  void grow(int dir){
    if(dir==1){
      units.add(new Unit(lastUnit().getXcor(),lastUnit().getYcor()-1,col,lastUnit()));
    }
    else if(dir==2){
      units.add(new Unit(lastUnit().getXcor()+1,lastUnit().getYcor(),col,lastUnit()));
    }
    else if(dir==3){
      units.add(new Unit(lastUnit().getXcor(),lastUnit().getYcor()+1,col,lastUnit()));
    }
    else if(dir==4){
      units.add(new Unit(lastUnit().getXcor()-1,lastUnit().getYcor(),col,lastUnit()));
    }
  }

  void display() {
    for (int i=0;i<size();i++) {
      if(i==0){
        get(0).superDisplay();
      }
      else{
        get(i).display();
      }
    }
  }

  ArrayList<Unit> getUnits() { 
    return units;
  }
    
  Unit remove(int ind){
    return units.remove(ind);
  }
  
  Unit get(int ind){
   return units.get(ind);
  }
 
 int size(){
   return units.size();
 }
  
 Unit lastUnit(){
   return units.get(units.size()-1);
 } 
 
 String toString(){
   String toStr = "<Snake:";
   for(int i=0;i<units.size();i++){
     toStr += units.get(i).toString() + ",";
   }
   toStr += ">\n";
   return toStr;
 }
 
}
