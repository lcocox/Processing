class fireCracker
{
  float x, Yspeed;
  float y = 0;

  fireCracker(float inX, float SpeedY)
  {
    x = inX;
    Yspeed = SpeedY;
  }

  void display()
  {
    rectMode(CORNER);
    strokeWeight(2);
    stroke(0);
    fill(0);
    line(x+4, y, x+4, y-5);
    fill(255, 0, 0);
    rect(x, y, 8, 18);
  }

  void move()
  {
    y = y + Yspeed;
    if (y>height)
    {
      y = 0;
      x = random(width);
      Yspeed = random(6, 8);
    }
  }

  boolean touch(float fx, float fy)
  {
    if ((x+4 >= (fx-15)) && (x <= (fx+15)))
    {
      if ((y+18) >= fy)
      {
        y = 0;
        x = random(width);
        Yspeed = random(6, 8);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

