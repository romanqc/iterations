Point myPoint;
Point otherPoint;
Point anotherPoint;
Plot plot;

/** The bouncing ball effect was 
  * taken directly from the processing 
  * page. I just copied and pasted the 
  * code, however, everything else is uniquely
  * my work. */

float t;

//int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape 

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float rad1 = 200;
float rad2 = 100;
//float rad3 = 150;

void setup() {
  //size(800, 500);
  fullScreen();
  plot = new Plot(500);
  plot.printPlot();
  //background(0);
  xpos = 300;
  ypos = 500;
}

void draw() {
  background(0);
  noCursor();
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad1 || xpos < rad1) {
    xdirection *= -1;
  }
  if (ypos > height-rad1 || ypos < rad1) {
    ydirection *= -1;
  }
  myPoint = new Point(int(xpos), int(ypos));
  //anotherPoint = new Point(int(xxxpos), int(yyypos));
  myPoint.drawPoint();
  //anotherPoint.drawPoint();
  plot.displayPlot();
  //plot.nearestNeighbor(myPoint);
  plot.drawToRadius(myPoint, rad1);
  //plot.nearestNeighbor(myPoint);
  t+=0.001;
  //saveFrame("frames/line-######.png");

}
