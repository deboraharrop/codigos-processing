int x = width;
int x2= width/2;
int x8= width/8;
int y16, y8, y, y2;
int bolinhaY = 20;
int bolinhaX1 = 300;
int bolinhaX2 = 250;
int bolinhaX3 = 50;
int bolinhaX4 = 100;
int p = 0; //

void setup() {

  size(400, 600);
  x=width;
  x2=width/2;
  x8=width/8;
  y=height;
  y2 = height/2;
  y16=height/16;//50
  y8=height/8;//100

  noStroke();
  colorMode(HSB, 360, 100, 100);
}
void draw () {
  background(0);
  // pontuação
  textSize(15);
  fill(0, 0, 100);
  text("Pontos: ", x/30, y8/3);
  text(p, x/6, y8/3);

  //cidade
  fill(150, 50, 80);
  rect(0, 13*y16, x8, 4*y16);
  triangle(0, 13*y16, x8/2, 6*y8, x8, 13*y16);
  rect(x8, 7*y8, x8, y8);
  rect(2*x8, 15*y16, x2, y8);
  rect(5/2*x8, 7*y8, 3*x8, 1/10*y);
  rect(6*x8, 6*y8, 2*x8, 2*y8);

  //nave
  fill(330, 50, 80);
  triangle(x8, y16, x2, 25, 7*x8, y16);
  arc(x2, y16, 7*x8, 3*y16, radians(0), radians(180));
  //escudo
  fill(60, 50, 80);
  rect(0, 7*y16, x, y16);

  // bombas
  fill (240, 50, 80);
  circle(bolinhaX1, bolinhaY-5, 30);
  circle(bolinhaX2, bolinhaY-10, 30);
  circle(bolinhaX3, bolinhaY, 30);
  circle(bolinhaX4, bolinhaY-20, 30);
  bolinhaY+=3;
  if (bolinhaY>=13*y16) {
    gameOver();
  }
}


void mousePressed() {

  if (bolinhaY >=7*y16 && bolinhaY<=8*y16) {

    bolinhaY =20;

    bolinhaX1 = int(random(20, 120));
    bolinhaX2 = int(random(120, 240));
    bolinhaX3 = int(random(210, 360));
    bolinhaX4 = int(random(300, 480));
    p=p+4;
  }
}

void gameOver() {
  background(0, 100, 100);
  textAlign(CENTER);
  fill(255, 0, 100);
  textSize(32);
  text("GAME OVER", x2, y2);

  textSize(25);
  fill(0, 0, 100);
  text("Pontos: ", x2-20, y2+30);
  text(p, x2+40, y2+30); //
}
