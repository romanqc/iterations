class Plot {
  
  /**
  *  The number of points in the plot
  */
  private int numberOfPoints;
  
  /**
  *  The array that stores the points
  */
  private Point plot[];
  
  /**
  *  This is the constructor for the Plot class
  */
  Plot(int numberOfPoints) {
    this.numberOfPoints = numberOfPoints;
    this.plot = new Point[numberOfPoints];
  }
  
  /**
  *  Will display the plot of points after point assignments
  */
  public void displayPlot() {
    stroke(255);
    strokeWeight(5);
    for (int i = 0; i < numberOfPoints; i++) {
      //noStroke();
      point(plot[i].x, plot[i].y);
    }
  }
  
  /**
  *  Display closest point
  */
  public void nearestNeighbor(Point p) {
    Point q = findClosestPoint(p);
    //stroke(255, 40);
    //strokeWeight(1);
    //line(p.x, p.y, q.x, q.y);
    //noFill();
    //ellipse(p.x, p.y, 2*radius, 2*radius);
    stroke(255, 20);
    strokeWeight(1);
    drawNoisyLine(p, q, t);
  }
  
  /**
  *  Given a point, will connect points in the radius of
  *  of that point. Radius is a parameter float
  */
  public void drawToRadius(Point p, float radius) {
    float distanceList[] = distances(p);
    for (int i = 0; i < distanceList.length; i++) {
      if (distanceList[i] <= radius) {
        //stroke(255);
        //strokeWeight(1);
        //noFill();
        //ellipse(p.x, p.y, 2*radius, 2*radius);
        strokeWeight(1);
        stroke(255, 20);
        //line(p.x, p.y, plot[i].x, plot[i].y);
        //stroke(255, 40);
        //strokeWeight(0.1);
        drawNoisyLine(p, plot[i], t);
      }
    }
  }
  
  /**
  *  Given a Point, will find the closest Point
  */
  private Point findClosestPoint(Point p) {
    float distanceList[] = distances(p);
    float minimum = distanceList[0];
    int index = 0;
    for (int i = 0; i < distanceList.length; i++) {
      if (minimum > distanceList[i] && minimum != 0 ) {
        minimum = distanceList[i];
        index = i;
      }
    }
    return plot[index];
  }
  
  /**
  *  Given a Point, Returns an array of distances 
  *  from that Point
  */
  private float[] distances(Point p) {
    float distances[] = new float[numberOfPoints];
    for (int i = 0; i < numberOfPoints; i++) {
      distances[i] = distance(p, plot[i]);
    }
    return distances;
  }
  
  /**
  *  Given two Points, will caclulate 
  *  the distance between them
  */
  private float distance(Point p, Point q) {
    return sqrt(pow(abs(q.x - p.x), 2) + pow(abs(q.y - p.y), 2));
  }
  
  /**
   * Method to assign positions of the points
  */
  private void assignPositions() {
    float t = 0.0;
    for (int i = 0; i < numberOfPoints; i++) {
      //int x = int(200*cos(t) + width/2);
      //int y = int(200*sin(t) + height/2);
      int x = int(random(width));
      int y = int(random(height));
      plot[i] = new Point(x, y);
      t+=0.314;
    }
  }
  
  public void drawNoisyLine(Point firstPoint, Point endPoint, float t) {
  float noiseScale = 0.01; // Adjust the noise scale for different levels of noise
  
  // Draw a noisy line between (x1, y1) and (x2, y2)
  noFill();
  beginShape();
  stroke(255);
  for (float i = 0; i <= 1; i += 0.01) {
    float x = lerp(firstPoint.x, endPoint.x, i);
    float y = lerp(firstPoint.y, endPoint.y, i);
    float noiseVal = noise(t * x * noiseScale, t * y * noiseScale);
    float noisyX = x + map(noiseVal, 0, 1, -50, 50); // Adjust the noise range for x
    float noisyY = y + map(noiseVal, 0, 1, -20, 20); // Adjust the noise range for y
    vertex(noisyX, noisyY);
  }
  endShape();
}
  
  /**
  *  Prints the plot of points to console after assignment
  */
  public void printPlot() {
    assignPositions();
    for (int i = 0; i < numberOfPoints; i++) {
      println(plot[i].x, plot[i].y);
    }
  }
  
  
}
