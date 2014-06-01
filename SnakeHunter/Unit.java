class Unit {
 
  int dir; //1 = north; 2 = east; 3 = south; 4 = west
  int val;
  float xcor,ycor;
  color col;
  Unit next;
  
  
  Unit(int dir,float xcor,float ycor,Unit next){
    this.dir = dir;
    this.xcor = xcor;
    this.ycor = ycor;
    this.next = next;
  }
 
  void display{
    stroke = noStroke();
    fill = color;
    rectMode(CENTER);
    rect(xcor,ycor,1,1);
  }
  
  void setColor(color col) {
    this.col = col;
  
  void setDir(int dir){
    this.dir = dir;
  }
  
  int getDir(){
    return dir;
  }
  
  Unit getNext(){
    return next;
  }

    
  
}
