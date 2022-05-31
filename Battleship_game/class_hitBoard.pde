class HitBoard {

  int[][] positions;
  int numRows, numCols, x_pos, y_pos;
  int colwidth = 40;
  int rowheight = 40;

  HitBoard (int _numRows, int _numCols, int _x_pos, int _y_pos) {

    numRows = _numRows;
    numCols = _numCols;
    x_pos = _x_pos;
    y_pos = _y_pos;

    positions = new int[numRows][numCols];

    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        positions[r][c] = 0;
      }
    }
  }

  void render() {
    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {          
        image(water, x_pos+r*colwidth, y_pos+c*rowheight, colwidth, rowheight);
      }
    }
    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        fill(0);
        text(positions[r][c], x_pos + 20 + c*colwidth, y_pos + 20 + r*rowheight);
      }
    }
  }
  void mouse() {
    if (mousePressed && !pressed) {
      pressed = true;
      if (mouseX < (x_pos + numCols*colwidth) && mouseX > x_pos && mouseY < (y_pos + numRows*rowheight) && mouseY > y_pos) {

        int m = ceil((mouseX-x_pos)/colwidth);
        int n = ceil((mouseY-y_pos)/rowheight);

        myHitBoard.positions[n][m] = 1;
        numPlaced++;
        if (numPlaced == 1) {
          numPlaced = 0;
        }
      }
    }
  }
}
