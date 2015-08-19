MovingZone movingZone;

int score = 0;
boolean start = false;
boolean win = false;
boolean lose = false;

void setup() {
  size(500, 500);
  movingZone = new MovingZone(0, width/8,4);
}

void draw() {
  if (!start)
  {
    background(255, 255, 0);
    textSize(width/15);
    fill(0);
    text("Runaway Band", width/4, height/3);
    textSize(width/40);
    text("       Click on the green band as it goes by.\n+5pt for middle zone. +1 outer zone. -3 missed strip.\n    Earn 2- points to win!(Negative points, you lose!)\n\n                Press any key to begin.", width/5, height/2);
  } else {
    if (!win && !lose)
    {
      background(0);
      fill(255);
      textSize(width/25);
      text("Score: " + score, width/20, height/20);
      movingZone.display();
      movingZone.move();
    }
  }
  if (win) {
    background(150, 50, 200);
    start = false;
    score = 0;
    textSize(width/10);
    fill(255);
    text("You Win!", width/3, height/3);
    textSize(width/40);
    text("     Press any key to play again.", width/3, height/2);
  }
  if (lose)
  {
    background(255, 0, 0);
    start = false;
    score = 0;
    textSize(width/10);
    fill(255);
    text("You lose!", width/3, height/3);
    textSize(width/40);
    text("     Press any key to play again.", width/3, height/2);
  }

  if (score < 0) {
    lose = true;
  }
  if (score >= 20) {
    win = true;
  }
}

void mousePressed() {
  if (start) {
    if (movingZone.clickedOuter(mouseX, mouseY))
    {
      score = score + 1;
    }
    if (movingZone.clickedInner(mouseX, mouseY))
    {
      score = score + 5;
    }
    if (movingZone.clickedBackground(mouseX, mouseY))
    {
      score = score - 3;
    }
  }
}

void keyPressed()
{
  if (!start) {
    movingZone = new MovingZone(0, width/8,4);
    start = true;
    win = false;
    lose = false;
  }
}

