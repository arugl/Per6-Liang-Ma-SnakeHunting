class FoodPellet {
  
  int xcor, ycor;
  color backgroundColor = color(122,78,209);
    
  public FoodPellet (int xcor, int ycor){
    xcor = ((xcor/10) * 10) - 5;
    if(xcor<0) xcor += width;
    ycor = ((ycor/10) * 10) - 5;
    if(ycor<0) ycor += height - 40;
    this.xcor = xcor;
    this.ycor = ycor;
  }
  
  void display(){
    ellipseMode(CENTER);
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(xcor,ycor,10,10);
  }
  
  void die(){
    rectMode(CENTER);
    stroke(backgroundColor);
    fill(backgroundColor);
    rect(xcor,ycor,10,10);
  }
  
  public int getXcor(){ return xcor; }
  public int getYcor(){ return ycor; }
  
}
