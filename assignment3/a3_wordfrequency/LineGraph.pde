class LineGraph {
  private DataPoint[] dataPoints;
  // Max x and y values that exists among data points.
  // Used to normalize the data to the end bounds of the graph
  private float xMax; 
  private float yMax;
  private float startX;
  private float startY;
  private float endX;
  private float endY;
  private PFont courierSmall;
  private PFont courierMedium;
  
  LineGraph(DataPoint[] dataPoints, float windowWidth, float windowHeight, float windowPadding) {
    this.dataPoints = dataPoints;
    this.startX = windowPadding;
    // Graph bounds that are based on the padding of the graph within the window
    // and the dimensions within the winodw
    this.startY = windowHeight - windowPadding;
    this.endX = windowWidth - windowPadding;
    this.endY = windowPadding;
    this.xMax = 0;
    this.yMax = 0;
    
    this.courierSmall = createFont("Courier", 16);
    this.courierMedium = createFont("Courier", 24);
    // Loop through each data point to determine the maximum
    // x and y values that exists within the datapoints
    for (int i = 0; i < dataPoints.length; i++) {
      DataPoint currDataPoint = dataPoints[i];
      if (currDataPoint.getX() > this.xMax) {
        this.xMax = currDataPoint.getX();
      }
      if (currDataPoint.getY() > this.yMax) {
        this.yMax = currDataPoint.getY();
      }
    }
  }
  
  float getScreenX(float graphX) {
    // Returns the pixel x value used by processings primitive shape functions
    // from the given datapoint x value
    return this.startX + (this.endX - this.startX)*graphX/this.xMax;
  }
  float getScreenY(float graphY) {
    // Returns the pixel y value used by processings primitive shape functions
    // from the given datapoint y value
    return (this.startY + (this.endY - this.startY)*graphY/this.yMax);
  }
  
  void displayAxes(int xValueMarkCount, int yValueMarkCount, String xAxisLabel, String yAxisLabel) {
    // y axis line
    line(this.startX, this.startY, this.startX, this.endY);
    // y axis data label values
    textFont(this.courierSmall);
    textAlign(RIGHT, CENTER);
    for (float i = 0; i <= yValueMarkCount; i++) {
      String yValue = "" + round(i*this.yMax/yValueMarkCount);
      text(yValue, this.startX - 10, this.startY + i/yValueMarkCount*(this.endY - this.startY));
    }  
    
    // Create y-axis label by rotating font
    // Set font to larger size
    textFont(this.courierMedium);
    pushMatrix();
    translate(this.startX - 75, (this.startY + this.endY)/2);
    rotate(-HALF_PI);
    textAlign(CENTER, CENTER);
    text(yAxisLabel, 0, 0);
    popMatrix();
    
    // x axis line 
    line(this.startX, this.startY, this.endX, this.startY);
    // x axis data label values
    textFont(this.courierSmall);
    textAlign(CENTER, TOP);
    for (float i = 0; i <= xValueMarkCount; i++) {
      String xValue = "" + round(i*this.xMax/xValueMarkCount);
      text(xValue, this.startX + i/xValueMarkCount*(this.endX - this.startX),  this.startY + 10);
    } 
    
    // Create x-axis label
    // Set font to larger size
    textFont(this.courierMedium);
    pushMatrix();
    translate((this.startX + this.endX)/2, this.startY + 50);
    textAlign(CENTER, CENTER);
    text(xAxisLabel, 0, 0);
    popMatrix();
    
  }
  
  void displayLines() {
    // Creates lines connecting the x and y coords from one datapoint to the next
    // Loops from the first to the second to last datapoint value
    for (int i = 0; i < dataPoints.length - 1; i++) {
      DataPoint currDataPoint = dataPoints[i];
      DataPoint nextDataPoint = dataPoints[i + 1];
      line(this.getScreenX(currDataPoint.getX()), this.getScreenY(currDataPoint.getY()), this.getScreenX(nextDataPoint.getX()), this.getScreenY(nextDataPoint.getY()));
    }
  }
  
  void displayPoints() {
    // Creates circles on the screen centered at each datapoint's x and y values
    for (int i = 0; i < dataPoints.length; i++) {
      DataPoint currDataPoint = dataPoints[i];
      circle(this.getScreenX(currDataPoint.getX()), this.getScreenY(currDataPoint.getY()), 8);
    }
  }
  
}
