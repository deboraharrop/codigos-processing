int [] [] M = new int [10] [10];
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  //criação de 10 bombas aleatorias/ utiliza-se while para evitar que coincida linha e coluna, criando menos que 10 bombas aleatorias
  int b=0;
  while (b<10) {
    int l= int(random(10));
    int c= int(random(10));
    if (M[l][c]!=1) {
      M[l][c]=1;
      b=b+1;
    }
  }
  for (int i=0; i<M.length; i++) {
    for (int j=0; j<M[0].length; j++) {
      print(M[i][j], " ");
    }
    println();
  }
}
void draw() {
  for (int i=0; i<M.length; i++) {
    for (int j=0; j<M[0].length; j++) {
      if (M[i][j]==1) {
        fill(0);
      }
      if (M[i][j]==0) {
        fill(255);
      }

      //BOMBA
      if (M[i][j]==10) {
        fill(0, 100, 100);
      }
      if (M[i][j]==5) {
        fill(330, 50, 100);
      }
      if (M[i][j]==3) {
        fill(210, 50, 100);
      }
      rect(j*50, i*50, 50, 50);
    }
  }
}
void mousePressed () {
  int x= mouseX/50;
  int y= mouseY/50;
  println(x, y);
  if (teste(x, y)) {

    if (M[x][y]==1) {
    } else {
      M[x][y]=5;
      for (int i=x-1; i<=x+1; i++) {
        for (int j=y-1; j<=y+1; j++) {
          if ((i>-1 && j>-1) && (i<10 && j<10) && M[j][i]==0) {
            M[j][i] = 3;
            print("(", j, i, ")");
          }
        }
      }
    }
  }
}

boolean teste (int X, int Y) {
  if (M[X][Y] == 1) {
    return true;
  } else return false;
}
