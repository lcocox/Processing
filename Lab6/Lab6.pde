MovingFaces[] theMovingFaces;
int[] number;
int quantity = 10;

void setup() {
  size(400, 400);
  background(0);
  theMovingFaces = new MovingFaces[quantity];
  number = new int[quantity];
  for (int i = 0; i < theMovingFaces.length; i++)
  {
    theMovingFaces[i] = new MovingFaces(random(40, width-40), random(40, height-40), random(-5, 5), random(-5, 5));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < theMovingFaces.length; i++) {
    theMovingFaces[i].display();
    theMovingFaces[i].move();
  }
}

void mousePressed() {
  for (int i = 0; i < theMovingFaces.length; i++) {
    if (theMovingFaces[i].clicked(mouseX, mouseY)) {
      number[i]++;
      if (number[i] >= 4) {
        number[i] = 0;
      }
      theMovingFaces[i].changeN(number[i]);
    }
  }
}

void keyPressed() {
  for (int i = 0; i < theMovingFaces.length; i++) {
    number[i] = 0;
    theMovingFaces[i].changeN(number[i]);
  }
}

