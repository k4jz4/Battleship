int leftoffset = 40;
int topoffset = 20;
int colwidth = 40;
int rowheight = colwidth;

int[][] spelplan = new int [11][11];

int leftoffset1=leftoffset+colwidth*13;
int topoffset1 = topoffset;

int[][] spelplan1 = new int[11][11];


void setup() {
  size(1050, 500);

  for ( int r = 0; r <= 10; r++) {
    for (int c = 0; c <= 10; c++) {
      spelplan[r][c] = 0;
    }
  }

  spelplan[3][4] = 1;
}

void draw() {



  for ( int r = 0; r <= 10; r++) {
    for (int c = 0; c <= 10; c++) {
      fill(255);
      rect(leftoffset+r*colwidth, topoffset+c*rowheight, colwidth, rowheight);

      rect(leftoffset1+r*colwidth, topoffset1+c*rowheight, colwidth, rowheight);
    }
  }

  for ( int r = 0; r <= 10; r++) {
    for (int c = 0; c <= 10; c++) {

      fill(0);
      text(spelplan[r][c], leftoffset + 20 + c*colwidth, topoffset + 20 + r*rowheight);
    }
  }
}
