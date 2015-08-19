coin[] Coins;
fireCracker[] FireCrackers;
color c = 255;
int scores = 0;
boolean start = false;
boolean win = false;
boolean lose = false;

void setup()
{
  size(800, 800);
  Coins = new coin[90];
  FireCrackers = new fireCracker[45];
  for (int i = 0; i < Coins.length; i++)
  {
    Coins[i] = new coin(random(width), random(2, 6));
  }

  for (int i = 0; i < FireCrackers.length; i++)
  {
    FireCrackers[i] = new fireCracker(random(width), random(3, 8));
  }
}

void draw()
{
  if (!start)
  {
    background(255, 255, 0);
    textSize(width/15);
    fill(0);
    textAlign(CENTER);
    text("GOLDEN HUNTER",width/2,height/3);
    textSize(width/40);
    text("Move mouse to move red bag and to get coins, don't get the firecracker!!!\n+1pt for each coin. -3pts for each firecracker.\nEarn 30 points to win!\nNegative points, you lose!\n(Click mouse to change the background during the game.)\n\nPress any key to begin.", width/2, height/2);
  } else {
    if (!win && !lose)
    {
      background(c);
      fill(0);
      textSize(width/25);
      textAlign(LEFT);
      text("Score: " + scores, width/20, height/20);
      for (int i = 0; i < Coins.length; i++)
      {
        Coins[i].display();
        Coins[i].move();
        if (Coins[i].touch(mouseX, height-50))
        {
          scores = scores + 1;
        }
      }
      for (int i = 0; i < FireCrackers.length; i++)
      {
        FireCrackers[i].display();
        FireCrackers[i].move();
        if (FireCrackers[i].touch(mouseX, height-50))
        {
          scores = scores - 3;
        }
      }
      strokeWeight(3);
      stroke(255, 255, 0);
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(mouseX, height-25, 30, 50);
    }
  }
  if (win)
  {
    background(0, 100, 200);
    start = false;
    scores = 0;
    textSize(width/10);
    textAlign(CENTER);
    fill(255);
    text("You Win!", width/2, height/3);
    textSize(width/40);
    text("Press any key to play again.", width/2, height/2);
  }
  if (lose)
  {
    background(255, 0, 0);
    start = false;
    scores = 0;
    textSize(width/10);
    fill(255);
    textAlign(CENTER);
    text("You lose!", width/2, height/3);
    textSize(width/40);
    text("Press any key to play again.", width/2, height/2);
  }
  if (scores < 0)
  {
    lose = true;
  }
  if (scores > 30)
  {
    win = true;
  }
}

void mousePressed()
{
  c = color(random(100,155),random(0,200),random(50,255));
}


void keyPressed()
{
  if (!start) {
    Coins = new coin[90];
    FireCrackers = new fireCracker[45];
    for (int i = 0; i < Coins.length; i++)
    {
      Coins[i] = new coin(random(width), random(2, 6));
    }
    for (int i = 0; i < FireCrackers.length; i++)
    {
      FireCrackers[i] = new fireCracker(random(width), random(3, 8));
    }
    start = true;
    win = false;
    lose = false;
  }
}

