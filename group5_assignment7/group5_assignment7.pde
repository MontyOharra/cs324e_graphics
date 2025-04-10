PVector windowSize = new PVector(800,800);
GameManager manager;

void settings() {
  size((int) windowSize.x, (int) windowSize.y);
}

void setup() {
  manager = new GameManager(windowSize);
}

void draw() {
  manager.render();
}  

void mousePressed() {
  manager.mousePressed(); 
}

void keyPressed() {
  manager.keyPressed(); 
}

void keyReleased() {
  manager.keyReleased(); 
}
