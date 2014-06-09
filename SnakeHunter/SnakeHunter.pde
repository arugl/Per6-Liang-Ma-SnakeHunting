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
  println("Fist Runthrough:"+snakes);


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

  recalculate();

  if (snakes.size()==1) {
    maxFood = 1;
  } //alters max food
  else if (snakes.size()==2) { 
    maxFood = 2;
  } else { 
    maxFood = 3;
  }

  //println("MaxFood:" + maxFood);

  if (food.size() < maxFood) {
    while (food.size () < maxFood) {
      newFood(); //adds food until max reached
    }
  }


  checkBullet(); //checksS bullets and collides if necessary
  bulletMovement(); //removes bullets that are off the board and displays remaining bullets
  snakeMovement(); //moves snake in 500ms intervals, then displays
  //chec
  checkFood();

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
      newFood(); //adds food until max reached
    }
  }


  bigGun.display();

  for (FoodPellet n : food) {
    n.display();
  }
}

void bulletMovement() {

  for (int i=0; i<bullets.size (); i++) {
    if (bullets.get(i).getYcor() < 0) {
      bullets.remove(i);
    } else {
      bullets.get(i).flying();
      bullets.get(i).display();
    }
  }
}

FoodPellet newFood() {
  Random stop = new Random();
  int randX = stop.nextInt(50);
  int randY = stop.nextInt(60);
  //println("RandX: " + randX);
  //println("RandY: " + randY);
  Tile tmp = tiles[randY][randX];

  while (tmp.isSnake () || tmp.isFood()) {
    randX = (int) stop.nextInt(50);
    randY = (int) stop.nextInt(60);
    tmp = tiles[randY][randX];
  }

  //println("RandX:" + randX);
  //println("RandY:" + randY);

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
          newSnakes(a, b); //*********************
          snakes.get(a).remove(b); //add this!! *****************************8
          bullets.remove(i);
        }
      }
    }
  }
}

void newSnakes(int snakeNumber, int unitNumber) {
  ArrayList<Unit> snakeInQuestion = snakes.get(snakeNumber).getUnits();
  ArrayList<Unit> one = new ArrayList<Unit>(snakeInQuestion.subList(0, unitNumber));
  println("One:" + one);
  ArrayList<Unit> two = new ArrayList<Unit>(snakeInQuestion.subList(unitNumber+1, snakeInQuestion.size()));
  println("Two:" + two);
  if (one.size() > 1) {
    snakes.add(new Snake(one));
  }
  if (two.size() > 1) {
    snakes.add(new Snake(two));
  }
}

void checkFood() { //checks for food collisions :D
  recalculate();
  println("Snakes:\n"+snakes);
  for (int i=0; i<food.size (); i++) {
    Tile n = tiles[food.get(i).getYcor()][food.get(i).getXcor()];
    if (n.isFood() && n.isSnake()) {
      //println("At1");
      for (int k=0; k<snakes.size (); k++) {
        for (int j=0; j<snakes.get (k).size(); j++) {
          println("Snake: "+snakes);
          println("Food: "+food);
          if (snakes.get(k).get(j).getXcor() == food.get(i).getXcor() && snakes.get(k).get(j).getYcor() == food.get(i).getYcor()) {
            snakes.get(k).grow(findGrowingSpace(snakes.get(k).lastUnit().getXcor(), snakes.get(k).lastUnit().getYcor(), i)); //find direction to grow in and grow
          }
        }
      }
      //recalculate();
    }
  }
}

int findGrowingSpace(int xcor, int ycor, int tmp) { //finds empty space to grow in
  println("\nGrowing Space");
  println("xcor:"+xcor);
  println("ycor:"+ycor);

  //recalculate();
  if (xcor < 49) {
    if (!tiles[xcor+1][ycor].isSnake() && !tiles[xcor+1][ycor].isFood() && !tiles[xcor+1][ycor].isBullet()) {
      return 2; //go east
    }
  }
  println("ok");
  if (xcor > 0) { 
    if (!tiles[xcor-1][ycor].isSnake() && !tiles[xcor-1][ycor].isFood() && !tiles[xcor-1][ycor].isBullet()) {
      return 4; //go west
    }
  }
  if (ycor < 59) { 
    if (!tiles[xcor][ycor+1].isSnake() && !tiles[xcor][ycor+1].isFood() && !tiles[xcor][ycor+1].isBullet()) {
      return 3; //go south
    }
  }
  if (ycor > 0) { 
    if (!tiles[xcor][ycor-1].isSnake() && !tiles[xcor][ycor-1].isFood() && !tiles[xcor][ycor-1].isBullet()) {
      return 1; //go north
    }
  }
  return -1;
} 

void keyPressed() {
  if (key == CODED || key == 'a' || key == 'd') {
    if (keyCode == RIGHT || key == 'd') {
      if (bigGun.getXcor() < width - 10) {
        bigGun.moveRight();
      }
      bigGun.display();
    } else if (keyCode == LEFT || key == 'a') {
      if (bigGun.getXcor() > 10) {
        bigGun.moveLeft();
      }
      bigGun.display();
    }
  } else if (key == ' ') {
    if (millis() - bulletTime >= 250) {
      Bullet bigBullet = new Bullet(bigGun.getXcor(), 590);
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

void recalculate() { //calculates values for snakes and food and bullets
  //RECALCULATING STATUS
  for (int i=0; i<tiles.length; i++) {
    for (int j=0; j<tiles[0].length; j++) {

      for (int a=0; a<snakes.size (); a++) { //check on status of snakes
        for (int b=0; b<snakes.get (a).size(); b++) {
          if (snakes.get(a).get(b).getXcor() == j && snakes.get(a).get(b).getYcor() == i) {
            tiles[i][j].changeSnake(true);
          } else {
            tiles[i][j].changeSnake(false);
          }
        }
      }

      for (int a=0; a<food.size (); a++) {
        if (food.get(a).getXcor() == j && food.get(a).getYcor() == i) {
          tiles[i][j].changeFood(true);
        } else {
          tiles[i][j].changeFood(false);
        }
      }

      for (int a=0; a<bullets.size (); a++) {
        if (bullets.get(a).getXcor() == j && bullets.get(a).getYcor() == i) {
          tiles[i][j].changeBullet(true);
        } else {
          tiles[i][j].changeBullet(false);
        }
      }
    }
  }
}


//=====================================================================================================================

void snakeMovement() {
  if (millis() - moveTime >= 200) {
    //checkFood();
    for (int i = 0; i < snakes.size (); i++) {
      Snake snake = snakes.get(i);

      Tile currLocation = tiles[snake.get(0).getYcor()][snake.get(0).getXcor()];
      Tile food = getClosestFood(currLocation);

      println("Current Location: " + currLocation);

      int dir = findDirection(currLocation.getXcor(), currLocation.getYcor(), food.getXcor(), food.getYcor());
      if (currLocation.equals(food.getParent())) {
        this.food.remove(i);
        this.food.add(newFood());
        recalculate();
      }
      println("Target Location: " + food);
      println("Direction: " + dir);
      snake.move(dir);
      checkFood();

      moveTime = millis();
    }
  }
  recalculate();
  //for(int i=0;i<snakes.size();i++){
  //if(tiles[snakes.get(i).get(0).getYcor()][snakes.get(i).get(0).getXcor()].hasFood()){


  for (Snake sn : snakes) {
    sn.display();
  }
}

//=====================================================================================================================

int findDirection(int startX, int startY, int endX, int endY) {

  ArrayList<Tile> open = new ArrayList<Tile>(); //used for A*
  ArrayList<Tile> closed = new ArrayList<Tile>(); //used for A*

  open.add(tiles[startY][startX]);
  //tiles[startY][startX].changeList(1); //in open list

  //println("FIRST RUN *****");
  //println(open);
  //println("StartX: " + startX + ",StartY: " + startY);
  //println("EndX: " + endX + ",EndY: " + endY);
  //println("SnakeTest: " + tiles[30][26].isSnake());
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

    //println("Closed List: " + closed);

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
      //println("Current Tile: " + goldenTile + "\n\n");
      //println(" YES YES YES YES YES " );
      //println("Closed:\n" + closed);
      //println("Searching: " + goldenTile);
      //println("Find: " + tiles[endY][endX]);
      return findPath(goldenTile, tiles[startY][startX]);
    } else {
      //open.get(minDistIndex).changeList(-1); //change to closed list
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

        if (closed.contains(neighbors.get(i))) {
        } //closed neighbors

        else if (!open.contains(neighbors.get(i))) { //neighbor not in open list
          neighbors.get(i).setParent(goldenTile); //sets goldenValue as parent
          neighbors.get(i).setGval(temp_g_score);
          neighbors.get(i).setFval(neighbors.get(i).getGval() + calcManhattanDistance(neighbors.get(i).getXcor(), neighbors.get(i).getYcor(), endX, endY));
          //neighbors.get(i).changeList(1);
          open.add(neighbors.get(i));
        } else if (open.contains(neighbors.get(i)) && temp_g_score < neighbors.get(i).getGval()) { //special cases if neighbor is in
          open.get(open.indexOf(neighbors.get(i))).setParent(goldenTile); //sets goldenValue as parent
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

//======================================================================================================================
int findPath (Tile start, Tile end) {
  //println("Start: " + start);
  //println("End: " + end);
  //println("Parent: " + start.getParent() +"\n");
  //if (start.getParent().equals(end)) {

  if (start.getYcor() > 0) {
    if (tiles[start.getYcor()-1][start.getXcor()].equals(end)) {
      return 3; //go north
    }
  } 
  if (start.getXcor() < 49) {
    if (tiles[start.getYcor()][start.getXcor()+1].equals(end)) {
      return 4; //go east
    }
  }
  if (start.getYcor() < 59) {
    if (tiles[start.getYcor()+1][start.getXcor()].equals(end)) {
      return 1; //go south
    }
  } 
  if (start.getXcor() > 0) {
    if (tiles[start.getYcor()][start.getXcor()-1].equals(end)) {
      return 2; //go west
    }
  }
  return findPath(start.getParent(), end);
}

