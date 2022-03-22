class Board1 {

  int[][] positions;

  int numRows, numCols;

  Board1 (int _numRows, int _numCols) {

    numRows = _numRows;
    numCols = _numCols;

    positions = new int[numRows][numCols];

    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        positions[r][c] = 0;
      }
    }
  }

  void render(float leftoffset) {

    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        fill(255);
        rect(leftoffset+r*colwidth, topoffset+c*rowheight, colwidth, rowheight);
      }
    }

    for ( int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {

        fill(0);
        text(positions[r][c], leftoffset + 20 + c*colwidth, topoffset + 20 + r*rowheight);
      }
    }
  }
}
