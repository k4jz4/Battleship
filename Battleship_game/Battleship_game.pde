String state;
int numPlaced = 0;

PImage water;
PImage miss;
PImage shipPart;
PImage hitShipPart;

boolean pressed = false;
ShipBoard myShipBoard;
HitBoard myHitBoard;

String read;


void setup() {
  size(1000, 500);
  water = loadImage("water.png");
  shipPart = loadImage("shipPart.png");
  myShipBoard = new ShipBoard(10, 10, 40, 20);
  myHitBoard = new HitBoard(10, 10, 200, 20);
  state = "setup";
}

void draw() {

  if (state == "setup") {

    myShipBoard.render(40);
    myShipBoard.mouse();
    myHitBoard.render(480);
  }

  if (state == "play") {
    
    read = myNetworking.read();
    
    if (read != "0"){
      
      // Utför fiendens drag
      
    }
    
    textSize(128);
    text("play", 350, 250);
  }

  if (!mousePressed) {
    pressed = false;
  }
}
