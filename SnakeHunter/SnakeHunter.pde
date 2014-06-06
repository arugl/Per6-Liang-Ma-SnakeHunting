import java.util.ArrayList;

int bulletTime = 0;
int moveTime = 0;

color backgroundColor = color(122,78,209);

ArrayList<Snake> snakes = new ArrayList<Snake>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

Gun bigGun = new Gun();
FoodPellet food;

boolean isFoodHere = false; //is food pelled on map?

void setup() {
  bulletTime = millis();
  moveTime = millis();
  size(500, 610);
  background(backgroundColor);
  snakes.add(new Snake(5));
}

void draw() {
  
  noStroke();
  fill(0);
  rectMode(CORNERS);
  rect(0,height-35,width,height);
  
  if(!isFoodHere){
    newFoodPellet();
  }
  
  bigGun.display();

  checkBullet();

  for (int i=0;i<bullets.size();i++) {
    if(bullets.get(i).getYcor() < 0){
      bullets.remove(i);
    }
    else {
      bullets.get(i).flying();
      bullets.get(i).display();
    }
  }
 
  for (int i=0;i<snakes.size();i++) {
   if(millis() - moveTime >= 500){
     snakes.get(i).move();
     moveTime = millis();
    }
    snakes.get(i).display();
  }
  
  food.display();
}

void newFoodPellet(){
  int randXcor = (int) random(0,height-35);
  int randYcor = (int) random(0,width);
  
  while(checkForSnakes(randXcor,randYcor)){
    randXcor = (int) random(0,height-35);
    randYcor = (int) random(0,width);
  }
  
  food = new FoodPellet(randXcor,randYcor);
  isFoodHere = true;
}

void checkBullet(){ //checks for collisions
  for(int i=0;i<snakes.size();i++){
    for(int j=0;j<snakes.get(i).getUnits().size();j++){
      for(int k=0;k<bullets.size();k++){
        if(bullets.get(k).getXcor() == snakes.get(i).getUnits().get(j).getXcor() && bullets.get(k).getYcor() == snakes.get(i).getUnits().get(j).getYcor()){
          bullets.get(k).die();
          bullets.remove(k);
          snakes.get(i).getUnits().get(j).die();
          snakes.get(i).getUnits().remove(j);
        }
      }
    }
  }
}
    
boolean checkForSnakes(int xcor, int ycor){
  for(int i=0;i<snakes.size();i++){
    for(int j=0;j<snakes.get(i).getUnits().size();j++){
      if(snakes.get(i).getUnits().get(j).getXcor() == xcor && snakes.get(i).getUnits().get(j).getYcor() == ycor){
        return true;
      }
    }
  }
  return false;
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT){
      bigGun.moveRight();
      bigGun.display();
    }
    else if (keyCode == LEFT){
      bigGun.moveLeft();
      bigGun.display();
    }
  }
  else if (key == ' ') {
    if (millis() - bulletTime >= 450) {
      Bullet bigBullet = new Bullet(bigGun.getXcor(), bigGun.getYcor() - 20);
      bullets.add(bigBullet);
      bulletTime = millis();
    }
  }
}

