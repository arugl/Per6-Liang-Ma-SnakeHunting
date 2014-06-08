public class Gun {
  private color col = color(209);
  private color gunBackgroundColor = color(0);
  private float xcor, ycor;
  private float xspeed, yspeed;

  public Gun() {
    xspeed = 10;
    xcor = 305;
    ycor = 590;
  }

  public void display() {
    stroke(60);
    fill(col);
    rectMode(CENTER);
    rect(xcor, ycor, 10, 30);
  }

  public void moveLeft() {
    die();
    xcor = xcor - xspeed;
    if (xcor < 5) {
      xcor = width - 5;
    }
  }

  public void moveRight() {
    die();
    xcor = xcor + xspeed;
    if (xcor > width - 5) {
      xcor = 5;
    }
  }

  public void die() {
    rectMode(CENTER);
    stroke(gunBackgroundColor);
    fill(gunBackgroundColor);
    rect(xcor, ycor, 10, 30);
  }

  public float getXcor() { 
    return xcor;
  }
  public float getYcor() { 
    return ycor;
  }
}
