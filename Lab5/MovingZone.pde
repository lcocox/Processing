class MovingZone
{ 
  float outerX;
  float outerWidth;
  float myXspeed;
  float innerWidth;
  float innerX;
  
  MovingZone(float a, float b, float c){
    outerX = a;
    outerWidth = b;
    myXspeed = c;
    innerWidth = b/2;
    innerX = a+b/4;
  }
  
  void display()
  {
    fill(140,255,170);
    rect(outerX, 0, outerWidth, height);
    fill(30,200,60);
    rect(innerX, 0, innerWidth, height);
  }
  
  void move()
  {
    outerX = outerX + myXspeed;
    innerX = innerX + myXspeed;
    if(outerX >= width)
    {
      myXspeed = random(2,6);
      innerWidth = random(width/32, width/16);
      outerWidth = random(width/15, width/6);
      outerX = 0;
      innerX = outerX + outerWidth/2 - innerWidth/2;
    }
  }
  
  boolean clickedOuter(float x, float y)
  {
    if(((x >= outerX) && (x < innerX)) || (((x > (innerX+innerWidth)) && (x <= (outerX+outerWidth))))){
      return true;
    }else{
      return false;
    }
    
  }
  
  boolean clickedInner(float x, float y)
  {
    if((x >= innerX) && (x <= (innerX+innerWidth)))
    {
      return true;
    }else{
      return false;
    }
  }
  
  boolean clickedBackground(float x, float y)
  {
    if((x < outerX) || (x > outerX+outerWidth))
    {
      return true;
    }else{
      return false;
    }
  }
}
