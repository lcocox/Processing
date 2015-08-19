class coin
{
  float x, Yspeed;
  float y = 0;

  coin(float inX, float SpeedY)
  {
    x = inX;
    Yspeed = SpeedY;
  }

  void display()
  {
    stroke(230, 180, 20);
    strokeWeight(2);
    fill(255, 255, 0);
    ellipse(x, y, 20, 20);
    rectMode(CENTER);
    fill(255);
    rect(x, y, 8, 8);
  }

  void move()
  {
    y = y + Yspeed;
    if (y>height)
    {
      y = 0;
      x = random(width);
      Yspeed = random(3, 6);
    }
  }

  boolean touch(float fx, float fy)
  {
    if ((x-5 >= (fx-15)) && (x+5 <= (fx+15)))
    {
      if ((y+8) >= fy)
      {
        y = 0;
        x = random(width);
        Yspeed = random(3, 7);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

