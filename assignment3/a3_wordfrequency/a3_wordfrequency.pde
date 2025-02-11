import java.util.Map;

DataPoint[] datapoints;
LineGraph lineGraph;
void setup() {
  size(800,800); 
  background(50);
  String[] lines = loadStrings("wordfrequency.txt");
  datapoints = new DataPoint[lines.length];
  // For each line, get both the frequency and the number of
  // words for said frequency, then populate the datapoints
  // array with datapoints for each of these values
  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    int frequency = Integer.parseInt(line.split(":")[0].trim());
    int wordCount = Integer.parseInt(line.split(":")[1].trim());
    DataPoint dataPoint = new DataPoint(frequency, wordCount);
    datapoints[i] = dataPoint;
  }
  // Create a new line graph. The final parameter can be changed to
  // introduce different padding among the graph.
  // A minimum of 100 padding should be used in order for better visual results
  lineGraph = new LineGraph(datapoints, width, height, 100);
}

void draw() {
  // Draw aces with a larger stroke size and white color
  fill(255);
  stroke(255);
  strokeWeight(3);
  lineGraph.displayAxes(10, 6, "Word Frequency", "Number of Words");
  // Draw datapoints with a smaller, white outline and a blue fill color
  strokeWeight(1);
  fill(0,0,255);
  stroke(255);
  lineGraph.displayPoints();
  // Draw connecting lines with a blue color
  stroke(0,0,255);
  lineGraph.displayLines();
}
