String state;
int comPos;
int numPlaced = 0;

PImage water;
PImage miss;
PImage shipPart;
PImage hitShipPart;

boolean pressed = false;
ShipBoard myShipBoard;
HitBoard myHitBoard;
Networking myNetworking;

String read;

void setup() {
  size(1000, 500);
  water = loadImage("water.png");
  shipPart = loadImage("shipPart.png");
  hitShipPart = loadImage("hitShipPart.png");
  miss = loadImage("miss.png");
  myShipBoard = new ShipBoard(10, 10, 40, 20);
  myHitBoard = new HitBoard(10, 10, 200, 20);
  myNetworking = new Networking();
  state = "setup";
}

void draw() {
  background(0);

  if (state == "setup") {

    myShipBoard.mouse();
  }

  if (state == "enemyTurn") {

    read = myNetworking.read();

    if (read != "0") {
      // Utför fiendens drag

      //tar reda på vart enemy har gjort något(den informationen finns i read)->
      comPos = read.indexOf(",");
      String rStr = read.substring(0, comPos);
      String cStr = read.substring(comPos+1);
      int r = int(rStr);
      int c = int(cStr);

      //  if (myShipBoard.positions[r][c] == 2) {
      myShipBoard.positions[c][r] = 3;
      //  } else {
      //    myShipBoard.positions[x][y] = 4;
      //  }    
      //TEST
      println(r);
      println(c);

      //Vad som sen ska hända på positionen som enemy har gjort något beror på träff eller miss

      state = "myTurn";
    }
  }

  if (state == "myTurn") {
    textSize(128);
    text("myTurn", 350, 250);
    // utför mitt drag
  }

  myShipBoard.render(40);
  myHitBoard.render(480);

  if (!mousePressed) {
    pressed = false;
  }
}
