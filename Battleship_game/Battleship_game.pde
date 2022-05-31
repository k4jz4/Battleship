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
  myHitBoard = new HitBoard(10, 10, 500, 20);
  myNetworking = new Networking();
  state = "setup";
}

void draw() {
  background(200);

  //***********STATE SETUP**************
  if (state == "setup") {

    myShipBoard.mouse();
  }


  //************STATE ENEMYTURN**********
  if (state == "enemyTurn") {

    read = myNetworking.read();

    if (read != "0") {

      comPos = read.indexOf(",");
      String rStr = read.substring(0, comPos);
      String cStr = read.substring(comPos+1);
      int r = int(rStr);
      int c = int(cStr);

      if (myShipBoard.positions[r][c] == 1) {
        myShipBoard.positions[c][r] = 2;
      } else if (myShipBoard.positions[r][c] == 0) {     
        myShipBoard.positions[c][r] = 3;
      }    
      //TEST
      println(r);
      println(c);

      state = "myTurn";
     
    }
  }

  //********STATE MYTURN***********
  if (state == "myTurn") {
    textSize(128);
    text("myTurn", 350, 250);

    if (myHitBoard.positions[r][c] == 1) {
        myHitBoard.positions[c][r] = 2;
      } else if (myHitBoard.positions[r][c] == 0) {     
        myHitBoard.positions[c][r] = 3;

    // 6+","+7;
    // utför mitt drag
  }

  //*******ALL STATES************
  myShipBoard.render();
  myHitBoard.render();

  if (!mousePressed) {
    pressed = false;
  }
}

void keyPressed() {
  for ( int c = 0; c < 4; c++) {
    for (int r = 0; r < 4; r++) {
      print(c);
      print(r);
      println(myShipBoard.positions[c][r]);
    }
  }
}
