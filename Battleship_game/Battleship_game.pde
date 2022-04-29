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
ShipBoard myShipBoard;
HitBoard myHitBoard;


void setup() {
  size(1050, 500);
  water = loadImage("water.png");
  myShipBoard = new ShipBoard(10, 10);
  myHitBoard = new HitBoard(10, 10);
  state = "setup";
}

void draw() {

  if (state == "setup") {

    myShipBoard.render(leftoffset);
    myHitBoard.render(480);

    if (mousePressed && !pressed) {
      pressed = true;
      if (mouseX < 440 && mouseX > leftoffset && mouseY < 420 && mouseY > topoffset) {

        int m = ceil((mouseX-leftoffset)/colwidth);
        int n = ceil((mouseY-topoffset)/rowheight);

        myShipBoard.positions[n][m] = 2;
        numPlaced++;
        if (numPlaced == 10) {
          numPlaced = 0;
          state = "play";
        }
      }
    }
  }

  if (state == "play") {
    textSize(128);
    text("play", 400, 250);
  }

  if (!mousePressed) {
    pressed = false;
  }
}
