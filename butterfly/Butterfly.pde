PImage img;
Grid grid;

void setup() {
  size(900, 900);
  img = loadImage("butterfly.png");
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(5);
  grid = new Grid(150, 150, 5);
  grid.display();
  //grid.colorAt(25, 25);
}
