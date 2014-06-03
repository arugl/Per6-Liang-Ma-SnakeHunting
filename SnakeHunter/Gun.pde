class Gun {
  color col;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float getXpos() {
    return xpos;
  }
  float getYpos() {
    return ypos;
  }
  Gun() {
    col = color(209);
    xspeed = 15;
    xpos = 255;
    ypos = 560;
  }
  void display() {
    stroke(60);
    fill(col);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 30);
  }

  void moveLeft() {
    xpos = xpos - xspeed;
    if (xpos < 5) {
      xpos = width - 5;
    }
  }
  
  void moveRight() {
    xpos = xpos + xspeed;
    if (xpos >= width) {
      xpos = 5;
    }
  }
  
  void shoot(Bullet bigBullet) {
    bigBullet = new Bullet(xpos, ypos);
  }
  
}
