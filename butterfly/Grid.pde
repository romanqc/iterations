
/* Working Application */

class Grid {
  
  int cols;
  int rows;
  int space;
  Point[][][] matrix;
  float brightness;

  Grid(int cols, int rows, int space) {
    this.cols = cols;
    this.rows = rows;
    this.space = space;
    matrix = new Point[cols][rows][1];
    fillMatrix();
  }
  
  public void display() {
    center();
    img.resize(gridLength(), gridHeight());
    //image(img, 0, 0);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        color c = img.get(int(i*space), int(j*space));
        brightness = brightness(c);
        if (brightness > 50) {
          matrix[i][j][0].setColor(c);
          matrix[i][j][0].display();
        }
      }
    }
  }
  
  private void fillMatrix() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        matrix[i][j][0] = new Point(i*space, j*space);
      }
    }
  }
  
  private void center() {
    translate(width/2, height/2);
    translate(-gridLength()/2, -gridHeight()/2);
  }
  
  public void colorAt(int x, int y) {
    matrix[x][y][0].getColor();
  }
  
  public void test(int x, int y) {
    assert x < cols; 
    assert y < rows;
    println(matrix[x][y][0].getColor());
  }
  
  public int gridLength() {
    return (cols - 1) * space;
  }
  
  public int gridHeight() {
    return (rows - 1) * space;
  }

}
