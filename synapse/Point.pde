class Point {
  /**
  * This is the x value for the point
  */
  int x;
  
  /**
  * This is the y value for the point
  */
  int y;
  
  /**
  * Constructor for point
  */
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  /**
  * Draws point at given x and y values
  */
  void drawPoint() {
    noFill();
    stroke(255);
    //strokeWeight(1);
    //ellipse(x, y, 5, 5);
    //point(x, y);
  }
  
}
