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
  myShipBoard = new ShipBoard(10, 10, 40, 20);
  myHitBoard = new HitBoard(10, 10, 200, 20);
  state = "setup";
}

void draw() {

  if (state == "setup") {

    myShipBoard.render(40);
    myShipBoard.mouse();
    myHitBoard.render(480);



    state = "play";
  }

  if (state == "play") {
    textSize(128);
    text("play", 400, 250);
  }

  if (!mousePressed) {
    pressed = false;
  }
}
