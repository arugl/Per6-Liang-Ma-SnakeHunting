import java.util.ArrayList;
import java.util.Random;

//public class SnakeHunter {

int bulletTime = 0;
int moveTime = 0;

Tile[][] tiles; //represents board

color backgroundColor = color(122, 78, 209);

ArrayList<Snake> snakes;
ArrayList<Bullet> bullets;
ArrayList<FoodPellet> food;
int maxFood;

Gun bigGun;


void setup() {

  snakes = new ArrayList<Snake>();
  bullets = new ArrayList<Bullet>();
  food = new ArrayList<FoodPellet>();
  bigGun = new Gun();

  bulletTime = millis();
  moveTime = millis();

  size(500, 640);
  background(backgroundColor);
  snakes.add(new Snake(5));

  tiles = new Tile[60][50];

  for (int i=0; i<tiles.length; i++) { //sets up each tile
    for (int j=0; j<tiles[0].length; j++) {
      tiles[i][j] = new Tile(j, i);
    }
  }
  
  //println(tiles[59][32]);
  
  /*String ret = ""; //this is working
  for(int i=0;i<tiles.length;i++){
    ret+="[";
    for(int j=0;j<tiles[0].length;j++){
      ret+=tiles[i][j]+",";
    }
    ret+="]\n";
  }
 
  println(ret);
  println("\n\n" + tiles[2][3]);*/
}

void draw() {  
  
  noStroke();
  fill(0);
  rectMode(CORNERS);
  rect(0, height - 40, width, height);

  for(int i=0;i<snakes.size();i++){ //alter all tiles that have snakes to display it
    for(int j=0;j<snakes.get(i).getUnits().size();j++){
      tiles[snakes.get(i).get(j).getYcor()][snakes.get(i).get(j).getXcor()].changeSnake(true);
    }
  }

  if (snakes.size()==1) { 
    maxFood = 1;
  } //alters max food
  else if (snakes.size()==2) { 
    maxFood = 2;
  } else { 
    maxFood = 3;
  }

  if (food.size() < maxFood) {
    while (food.size () < maxFood) {
      food.add(newFood()); //adds food until max reached
    }
  }

  checkBullet(); //checks bullets and collides if necessary
  bulletMovement(); //removes bullets that are off the board and displays remaining bullets
  snakeMovement(); //moves snake in 500ms intervals, then displays

  bigGun.display();

  for (FoodPellet n : food) {
    n.display();
  }
}

void snakeMovement() {
  for (int i = 0; i < snakes.size (); i++) {
    Snake snake = snakes.get(i);
    if (millis() - moveTime >= 500) {

      Unit end = snake.lastUnit();
      tiles[end.getYcor()][end.getXcor()].changeSnake(false); //old spot no longer has snake

      Tile currLocation = tiles[snake.get(0).getYcor()][snake.get(0).getXcor()];
      Tile food = getClosestFood(currLocation);
      println("Current Location: " + currLocation);
      println("Target Location: " + food);
      //println("Target Location Has Food: " + food.isFood());
      int dir = findDirection(currLocation.getXcor(), currLocation.getYcor(), food.getXcor(), food.getYcor());
      println("Direction: " + dir);
      snake.move(dir);
      //println("Direction: " + dir);

      Unit head = snake.get(0); //new spot gets snake
      tiles[head.getYcor()][head.getXcor()].changeSnake(true);

      moveTime = millis();
    }
    snake.display();
  }
}

void bulletMovement() {

  for (int i=0; i<bullets.size (); i++) {
    tiles[bullets.get(i).getYcor()][bullets.get(i).getXcor()].changeBullet(false); //remove bullet from previous position tile
    if (bullets.get(i).getYcor() < 0) {
      bullets.remove(i);
    } else {
      bullets.get(i).flying();
      tiles[bullets.get(i).getYcor()][bullets.get(i).getXcor()].changeBullet(true); //add bullet to new position tile
      bullets.get(i).display();
    }
  }
}

FoodPellet newFood() {
  Random stop = new Random();
  int randX = stop.nextInt(50);
  int randY = stop.nextInt(60);
  println("RandX: " + randX);
  println("RandY: " + randY);
  Tile tmp = tiles[randY][randX];

  while (tmp.isSnake () || tmp.isFood()) {
    randX = (int) stop.nextInt(50);
    randY = (int) stop.nextInt(60);
    tmp = tiles[randY][randX];
  }

  tiles[randY][randX].changeFood(true);

  FoodPellet newFood = new FoodPellet(randX, randY);
  food.add(newFood);
  return newFood;
}

void checkBullet() { //checks for collisions
  for (int i=0; i<bullets.size (); i++) {
    int xcor = bullets.get(i).getXcor();
    int ycor = bullets.get(i).getYcor();

    for (int a=0; a<snakes.size (); a++) {
      for (int b=0; b<snakes.get (a).getUnits().size(); b++) {
        if (snakes.get(a).get(b).getXcor() == xcor && snakes.get(a).get(b).getYcor() == ycor) {
          snakes.get(a).get(b).die();
          snakes.get(a).remove(b); //add this!! *****************************8
          bullets.remove(i);
          tiles[ycor][xcor].changeSnake(false);
          tiles[ycor][xcor].changeBullet(false);
        }
      }
    }
  }
}



void keyPressed() {
  if (key == CODED || key == 'a' || key == 'd') {
    if (keyCode == RIGHT || key == 'd') {
      bigGun.moveRight();
      bigGun.display();
    } else if (keyCode == LEFT || key == 'a') {
      bigGun.moveLeft();
      bigGun.display();
    }
  } else if (key == ' ') {
    if (millis() - bulletTime >= 250) {
      Bullet bigBullet = new Bullet(bigGun.getXcor(), bigGun.getYcor() - 20);
      bullets.add(bigBullet);
      bulletTime = millis();
    }
  }
}

Tile getClosestFood(Tile n) {
  int closestDist = Integer.MAX_VALUE;
  int xcor = -1;
  int ycor = -1;

  for (int i=0; i<tiles.length; i++) {
    for (int j=0; j<tiles[0].length; j++) {
      if (tiles[i][j].isFood()) {
        if (abs(n.getXcor()-j) + abs(n.getYcor()-i) < closestDist) { //manhattan distance of closest food
          closestDist = abs(n.getXcor()-j) + abs(n.getYcor()-i);
          xcor = j;
          ycor = i;
        }
      }
    }
  }
  return tiles[ycor][xcor];
}

int findDirection(int startX, int startY, int endX, int endY) {

  ArrayList<Tile> open = new ArrayList<Tile>(); //used for A*
  ArrayList<Tile> closed = new ArrayList<Tile>(); //used for A*

  open.add(tiles[startY][startX]);
  //tiles[startY][startX].changeList(1); //in open list

  println("FIRST RUN *****");
  println(open);
  println("StartX: " + startX + ",StartY: " + startY);
  println("EndX: " + endX + ",EndY: " + endY);
  println("SnakeTest: " + tiles[30][26].isSnake());
  //println(closed);

  while (!open.isEmpty ()) {

    for (int i=0; i<open.size (); i++) { //set f-,g-,and h-values
      int gVal = calcManhattanDistance(startX, startY, open.get(i).getXcor(), open.get(i).getYcor());
      int hVal = calcManhattanDistance(open.get(i).getXcor(), open.get(i).getYcor(), endX, endY);
      int fVal = gVal + hVal;
      open.get(i).setFval(fVal);
      open.get(i).setGval(gVal);
      open.get(i).setHval(hVal);
    }

    //println(open);

    //find unit with lowest f-val
    int minDist = Integer.MAX_VALUE;
    int minDistIndex = 0;
    for (int i=0; i<open.size (); i++) {
      if (open.get(i).getFval() < minDist) {
        minDist = open.get(i).getFval();
        minDistIndex = i;
      }
    }
    
    

    Tile goldenTile = open.get(minDistIndex); //currently considering this tile

    //println(goldenTile);

    if (goldenTile.equals(tiles[endY][endX])) { //search up list of parents
      return findPath(goldenTile, tiles[startY][startX]);
    } else {
      open.get(minDistIndex).changeList(-1); //change to closed list
      closed.add(0, open.remove(minDistIndex));

      //adding neighbors to a new arraylist
      //catching exceptions if they go out of bounds
      ArrayList<Tile> neighbors = new ArrayList<Tile>();
      if (goldenTile.getYcor()+1 <= 59) {
        if (!tiles[goldenTile.getYcor()+1][goldenTile.getXcor()].isSnake()) {
          neighbors.add(tiles[goldenTile.getYcor()+1][goldenTile.getXcor()]);
        }
      }
      if (goldenTile.getYcor()-1 >= 0) {
        if (!tiles[goldenTile.getYcor()-1][goldenTile.getXcor()].isSnake()) {
          neighbors.add(tiles[goldenTile.getYcor()-1][goldenTile.getXcor()]);
        }
      }
      if (goldenTile.getXcor()+1 <= 49) {
        if (!tiles[goldenTile.getYcor()][goldenTile.getXcor()+1].isSnake()) {
          neighbors.add(tiles[goldenTile.getYcor()][goldenTile.getXcor()+1]);
        }
      }
      if (goldenTile.getXcor()-1 >=0) {
        if (!tiles[goldenTile.getYcor()][goldenTile.getXcor()-1].isSnake()) {
          neighbors.add(tiles[goldenTile.getYcor()][goldenTile.getXcor()-1]);
        }
      }

      for (int i=0; i<neighbors.size (); i++) { //neighbors of tile
        int temp_g_score = goldenTile.getGval() + 10; //g-score

        if (closed.contains(neighbors.get(i))) { } //closed neighbors

        if (!open.contains(neighbors.get(i))) { //neighbor not in open list
          neighbors.get(i).setParent(closed.get(0)); //sets goldenValue as parent
          neighbors.get(i).setGval(temp_g_score);
          neighbors.get(i).setFval(neighbors.get(i).getGval() + calcManhattanDistance(neighbors.get(i).getXcor(), neighbors.get(i).getYcor(), endX, endY));
          neighbors.get(i).changeList(1);
          open.add(neighbors.get(i));
        } 
        else if (open.contains(neighbors.get(i)) && temp_g_score < neighbors.get(i).getGval()) { //special cases if neighbor is in
          open.get(open.indexOf(neighbors.get(i))).setParent(closed.get(0)); //sets goldenValue as parent
          open.get(open.indexOf(neighbors.get(i))).setGval(temp_g_score);
          open.get(open.indexOf(neighbors.get(i))).setFval(neighbors.get(i).getGval() + calcManhattanDistance(neighbors.get(i).getXcor(), neighbors.get(i).getYcor(), endX, endY));
        }
      }
    }
  }
  return -1;
}

int calcManhattanDistance(int startX, int startY, int finX, int finY) { //calculates manhattan distance- helps A*
  return abs(finX - startX) + abs(finY - startY);
}

int findPath (Tile start, Tile end) {
  //println(start.getParent());
  if (start.getParent().equals(end)) {
    if (start.getYcor() < 59) {
      if (tiles[start.getYcor()+1][start.getXcor()].equals(end)) {
        return 3; //go south
      }
    } 
    if (start.getYcor() > 0) {
      if (tiles[start.getYcor()-1][start.getXcor()].equals(end)) {
        return 1; //go north
      }
    } 
    if (start.getXcor() < 49) {
      if (tiles[start.getYcor()][start.getXcor()+1].equals(end)) {
        return 2; //go east
      }
    }
    if (start.getXcor() > 0) {
      if (tiles[start.getYcor()][start.getXcor()-1].equals(end)) {
        return 4; //go west
      }
    }
  }
  return findPath(start.getParent(), end);
}
//}
//1=north, 2=east, 3=south, 4=west
/*        
 if(!tiles[startY+1][startX].isSnake()){ //tile is not occupied by snake
 if (tiles[startY+1][startX].isList() == 0){ //tile is not already in a list (open/closed)
 open.add(tiles[startY+1][startX]); //add the tile
 }else if (tiles[startY+1][startX].isList() == 1){ //tile is in open list
 if (open.get(open.indexOf(tiles[startY+1][startX])).getGval() < goldenTile.getGval()){ //if tile gVal < current gVal
 
 tiles[startY+1][startX].changeList(true);
 }
 
 
 
 
 open.add(0,tmp);
 if(!tiles[startY+1][startX].isSnake() && !tiles[startY+1][startX].isList()){
 open.add(tiles[startY+1][startX]);
 tiles[startY+1][startX].changeList(true);
 }
 if(!tiles[startY-1][startX].isSnake() && !tiles[startY-1][startX].isList()){
 open.add(tiles[startY-1][startX]);
 tiles[startY-1][startX].changeList(true);
 }
 if(!tiles[startY][startX+1].isSnake() && !tiles[startY][startX+1].isList()){
 open.add(tiles[startY][startX+1]);
 tiles[startY][startX+1].changeList(true);
 }
 if(!tiles[startY][startX-1].isSnake() && !tiles[startY][startX-1].isList()){
 open.add(tiles[startY][startX-1]);
 tiles[startY][startX-1].changeList(true);
 }
 
 closed.add(0,open.remove(0));
 
 
 //set parent of unit
 closed.get(0).setParent(open.get(minDistIndex));
 //remove unit with lowest f-value from open list and add to closed list
 closed.add(open.remove(minDistIndex));
 */
