int leftoffset = 40;
int topoffset = 20;
int colwidth = 40;
int rowheight = colwidth;
String state;
int numPlaced = 0;

PImage water;
PImage miss;
PImage shipPart;
PImage hitShipPart;

boolean pressed = false;

Board myBoard;
Board1 myHitBoard;
Board computerBoard;
Board1 computerHitBoard;

void setup() {
  size(1050, 900);
  water = loadImage("water.png");
  myBoard = new Board(10, 10);
  myHitBoard = new Board1(10, 10);
  computerBoard = new Board(10, 10);
  computerHitBoard = new Board1(10, 10);
  state = "setup";
}

void draw() {

  if (state == "setup") {

    myBoard.render(leftoffset);
    myHitBoard.render(480);

    if (mousePressed && !pressed) {
      pressed = true;
      if (mouseX < 440 && mouseX > leftoffset && mouseY < 420 && mouseY > topoffset) {

        int m = ceil((mouseX-leftoffset)/colwidth);
        int n = ceil((mouseY-topoffset)/rowheight);

        myBoard.positions[n][m] = 2;
        numPlaced++;
        if (numPlaced == 10) {
          numPlaced = 0;
          state = "computerSetup";
        }
      }
    }
  }

  if (state == "computerSetup") {
    pushMatrix();
    translate(0, 450);
    computerBoard.render(leftoffset);
    computerHitBoard.render(480);

    if (mousePressed && !pressed) {
      pressed = true;
      if (mouseX < 440 && mouseX > leftoffset && mouseY < 420 + 450 && mouseY > topoffset + 450) {

        int m = ceil((mouseX-leftoffset)/colwidth);
        int n = ceil((mouseY-(topoffset + 450))/rowheight);

        computerBoard.positions[n][m] = 2;
        print(n);
        print(" ");
        println(m);
        numPlaced++;
        if (numPlaced == 10) {
          state = "play";
        }
      }
    }
    popMatrix();
  }

  if (state == "play") {
    textSize(128);
    text("play", 400, 250);
  }

  if (!mousePressed) {
    pressed = false;
  }
}
