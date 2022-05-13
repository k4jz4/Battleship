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
  myShipBoard = new ShipBoard(10, 10, 40, 20);
  myHitBoard = new HitBoard(10, 10, 200, 20);
  myNetworking = new Networking();
  state = "setup";
}

void draw() {

  if (state == "setup") {

    myShipBoard.render(40);
    myShipBoard.mouse();
    myHitBoard.render(480);

  }


  if (state == "enemyTurn") {

    read = myNetworking.read();

    if (read != "0") {
      // Utför fiendens drag

      //tar reda på vart enemy har gjort något(den informationen finns i read)->
      comPos = read.indexOf(",");
      String xStr = read.substring(0, comPos);
      String yStr = read.substring(comPos+1);
      int x = int(xStr);
      int y = int(yStr);
      
      //TEST
      println(x);
      println(y);

      //Vad som sen ska hända på positionen som enemy har gjort något beror på träff eller miss


      state = "myTurn";
    }

    if (state == "myTurn") {

      // utför mitt drag
    }

    textSize(128);
    text("play", 350, 250);
  }

  if (!mousePressed) {
    pressed = false;
  }
}
