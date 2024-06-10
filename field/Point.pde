class Point {
  float x;
  float y;
  float rad;
  float ang;
  boolean enableNoise;
  /** Radius of ball (noise range)*/
  float MAX_RADIUS = 10;
  /** Angle of ball (noise range)*/
  float MAX_ANGLE = TWO_PI;
  
  Point(float x, float y, float rad, float ang, boolean enableNoise) {
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.ang = ang;
    this.enableNoise = enableNoise;
  }
  
  void display() {
    if (enableNoise == true) {
      createNoise();
    } else {
      point(x, y);
    }
  }
  
  void createNoise() {
    float x1;
    float y1;
    
    float r = noise(rad);
    r = map(r, 0, 1, 0, MAX_RADIUS); 
    float a = noise(ang);
    a = map(a, 0, 1, 0, MAX_ANGLE);
    
    x1 = x + r * cos(a);
    y1 = y + r * sin(a);
    
    point(x1, y1);
  }
  
}
