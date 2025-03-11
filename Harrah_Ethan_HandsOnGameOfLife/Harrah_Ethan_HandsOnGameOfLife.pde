import java.util.ArrayList;

int xSize = 800;
int ySize = 800;
int cellSize = 15;
int framerateValue = 10;  // using a separate variable to avoid confusion with Processing's frameRate()

Grid grid;

void settings() {
  size(xSize, ySize); 
}

void setup() {
  frameRate(framerateValue); // sets Processing's frame rate
  grid = new Grid(xSize, ySize, cellSize, framerateValue);
}

void draw() {
  background(0);
  grid.renderCells();
  grid.renderGridLines();
  
  // Automatic simulation update based on framerate if running
  if (grid.isSimRunning && frameCount % grid.framerate == 0) {
    grid.calculateNextStep();
  }
  
  // Display simulation status text on the top-right corner:
  textAlign(RIGHT, TOP);
  textSize(16);
  if (grid.isSimRunning) {
    fill(0, 255, 0); // green
    text("Simulation: On", width - 10, 10);
  } else {
    fill(255, 0, 0); // red
    text("Simulation: Off", width - 10, 10);
  }
}

void mousePressed() {
  grid.changeCell();
}

void keyPressed() {
  if (key == 'a') { 
    // Manual step update
    grid.calculateNextStep();
    println("Manual update: next step calculated.");
  } else if (key == ' ') {
    // Toggle simulation running state on space bar press
    grid.isSimRunning = !grid.isSimRunning;
    println("Simulation running: " + grid.isSimRunning);
  }
}
