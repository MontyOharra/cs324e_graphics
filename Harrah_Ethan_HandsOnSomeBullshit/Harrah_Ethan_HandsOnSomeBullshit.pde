PVector cameraPosition;

void setup() {
  size(900, 900, P3D);
  PVector cameraPosition = new PVector(100,100,100);
}

void draw() {
  background(255);
  line(0,0,0,1000,0,0); // x axis
  line(0,0,0,0,1000,0); // y axis
  line(0,0,0,0,0,1000); // z axis
  translate(50,50,50);
  sphere(25);
  camera(100*cos(mouseX/10), 100*sin(mouseX/10), 100,
       0.0, 0.0, 0.0, 
       0.0, 1.0, 0.0);
  
}
 
void keyPressed() {
  if (key == 0) {
    cameraPosition.x += 1; 
  }
  else if (key == 1) {
    cameraPosition.x -= 1; 
  }
}
