class FoodPellet {
  
  int xcor, ycor;
  color backgroundColor = color(122,78,209);
    
  public FoodPellet (int xcor, int ycor){
    this.xcor = xcor;
    this.ycor = ycor;
  }
  
  void display(){
    ellipseMode(CENTER);
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(xcor*10,ycor*10,10,10);
  }
  
  void die(){
    rectMode(CENTER);
    stroke(backgroundColor);
    fill(backgroundColor);
    rect(xcor,ycor,10,10);
  }
  
  public int getXcor(){ return xcor; }
  public int getYcor(){ return ycor; }
 
  String toString(){
    String retStr = "";
    retStr += "[xcor:" + xcor + "ycor:" + ycor + "]";
    return retStr;
  }
  
}
