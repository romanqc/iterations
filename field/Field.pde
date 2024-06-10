float t = 0;

int cols = 140;
int rows = 80;
int space = 15;
Point points[][] = new Point[cols][rows];
float startRad[][] = new float[cols][rows];
float startAng[][] = new float[cols][rows];

float r = 100;

void setup() {
  //size(800, 800);
  fullScreen();
  //background(0);
  frameRate(60);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      startRad[i][j] = random(10);
    }
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      startAng[i][j] = random(-TWO_PI);
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  strokeWeight(3);
  stroke(255);
  
  translate(-space*(cols-1)/2, -space*(rows-1)/2);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      points[i][j] = new Point(i*space, j*space, t+startRad[i][j], t+startAng[i][j], true);
      points[i][j].display();
    }
  }
  translate(space*(cols-1)/2, space*(rows-1)/2);

  //Point point1 = new Point(0, 0, 0+t, true);
  //Point point2 = new Point(50, 0, 1+t, true);
  //point1.display();
  //point2.display();
  
  fill(0);
  stroke(0);
  ellipse(0, 0, 100+100*t, 100+100*t);
  
  
  t+=0.01;
  //saveFrame("frames/line-######.png");
}


void findCenter() {
  strokeWeight(1);
  point(0, 0);
}
