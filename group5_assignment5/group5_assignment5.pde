/**
 * 3D Scene in Processing with Simple Camera Controls
 * 
 * Use W, A, S, D to move the camera up, left, down, and right (relative to the XY plane).
 */

float cameraX = 0;   // Left/right
float cameraY = 200; // Up/down
float cameraZ = 200; // Distance "above" the plane

Dog dog;

void setup() {
  size(800, 600, P3D);  // 3D rendering
  // Smooth rendering if desired:
  dog = new Dog(0,0,0);
  smooth();
}

void draw() {
  // Set the camera so it looks at (0,0,0) with the 'up' vector along +Y
  camera(cameraX, cameraY, cameraZ, 
         0, 0, 0, 
         0, 1, 0);

  background(200);   // Light gray background
  
  // Draw the axes
  drawAxes();

  // Optionally, draw a grid on the XY-plane near the origin
  drawXYPlaneGrid(400, 20);
  
  // ...You can draw other 3D objects here...
  // e.g., a box at the origin:
  pushMatrix();
    fill(150, 0, 0);
    translate(0, 0, 0);
    box(30);
  popMatrix();
  
  dog.render();
  dog.move();
}

void drawAxes() {
  strokeWeight(2);

  // X-axis in red
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);

  // Y-axis in green
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);

  // Z-axis in blue
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
}

void drawXYPlaneGrid(int size, int step) {
  // Draw lines on the XY plane from -size to +size in both X and Y directions
  strokeWeight(1);
  stroke(150); // Gray
  
  // Lines parallel to X-axis
  for (int y = -size; y <= size; y += step) {
    line(-size, y, 0, size, y, 0);
  }
  
  // Lines parallel to Y-axis
  for (int x = -size; x <= size; x += step) {
    line(x, -size, 0, x, size, 0);
  }
}

void keyPressed() {
  // W: move the camera up (decrease Y) 
  if (key == 'w' || key == 'W') {
    cameraY -= 10;
  }
  // S: move the camera down (increase Y)
  if (key == 's' || key == 'S') {
    cameraY += 10;
  }
  // A: move the camera left (decrease X)
  if (key == 'a' || key == 'A') {
    cameraX -= 10;
  }
  // D: move the camera right (increase X)
  if (key == 'd' || key == 'D') {
    cameraX += 10;
  }
}
