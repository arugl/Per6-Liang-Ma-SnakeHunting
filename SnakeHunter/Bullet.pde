class Bullet {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  color col;
  float getXpos() {
    return xpos;
  }
  float getYpos() {
    return ypos;
  }
  Bullet() {
  }
  Bullet(float newXpos, float newYpos) {
    col = color(62);
    yspeed = 15;
    xpos = newXpos;
    ypos = newYpos;
  } 
  void display() {
    stroke(255);
    fill(col);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 10);
  }
  void flying() {
    ypos = ypos - yspeed;
  }
}
