class DataPoint {
  // Basic class just used to store x and y values for more readable access
  private float x;
  private float y;
  
  DataPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  float getX() {
    return this.x; 
  }
  float getY() {
    return this.y; 
  }
  
}
