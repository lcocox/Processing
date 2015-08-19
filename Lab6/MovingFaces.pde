class MovingFaces {
  float xCoord;
  float yCoord;
  float xSpeed;
  float ySpeed;
  int num = 0;

  MovingFaces(float x, float y, float speedX, float speedY) {
    xCoord = x;
    yCoord = y;
    xSpeed = speedX;
    ySpeed = speedY;
  }

  void smiley() {
    strokeWeight(1);
    fill(255, 255, 0);
    ellipse(xCoord, yCoord, 40, 40);
    strokeWeight(3.5);
    line(xCoord-8, yCoord-8, xCoord-8, yCoord-1);
    line(xCoord+8, yCoord-8, xCoord+8, yCoord-1);
    fill(0);
    arc(xCoord, yCoord+6, 20, 18, 0, PI, PIE);
  }

  void surprised() {
    strokeWeight(1);
    fill(255, 0, 255);
    ellipse(xCoord, yCoord, 40, 40);
    strokeWeight(3.5);
    line(xCoord-8, yCoord-8, xCoord-8, yCoord-1);
    line(xCoord+8, yCoord-8, xCoord+8, yCoord-1);
    fill(0);
    ellipse(xCoord, yCoord+8, 10, 10);
  }

  void silly() {
    strokeWeight(1);
    fill(0, 255, 255);
    ellipse(xCoord, yCoord, 40, 40);
    strokeWeight(3.5);
    line(xCoord-8, yCoord-8, xCoord-8, yCoord-1);
    line(xCoord+8, yCoord-8, xCoord+8, yCoord-1);
    strokeWeight(2);
    line(xCoord-8, yCoord+4, xCoord+8, yCoord+4);
    fill(255, 0, 0);
    strokeWeight(1);
    arc(xCoord+3, yCoord+4, 8, 20, 0, PI, PIE);
  }

  void unamused() {
    strokeWeight(1);
    fill(255, 0, 0);
    ellipse(xCoord, yCoord, 40, 40);
    strokeWeight(3.5);
    line(xCoord-8, yCoord-8, xCoord-8, yCoord-1);
    line(xCoord+8, yCoord-8, xCoord+8, yCoord-1);
    strokeWeight(2);
    line(xCoord-8, yCoord+10, xCoord+8, yCoord+4);
  }

  void display() {
    if (num == 0) {
      smiley();
    }
    if (num == 1) {
      surprised();
    }
    if (num == 2) {
      silly();
    }
    if (num == 3) {
      unamused();
    }
  }

  void move() {
    xCoord = xCoord + xSpeed;
    yCoord = yCoord + ySpeed;
    if ((xCoord - 20 < 0) || ((xCoord + 20) > width))
    {
      xSpeed = -1 * xSpeed;
    }
    if ((yCoord - 20 < 0) || ((yCoord + 20) > height))
    {
      ySpeed = -1 * ySpeed;
    }
  }

  void changeN(int number) {
    num = number;
  }

  boolean clicked(float m, float n) {
    if (sqrt((sq((m-xCoord))+sq((n-yCoord)))) <= 20) {
      return true;
    } else {
      return false;
    }
  }
}

