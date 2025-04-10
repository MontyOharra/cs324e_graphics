PVector windowSize = new PVector(500,500);
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
