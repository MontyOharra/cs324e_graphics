PVector windowSize = new PVector(500,500);
GameWrapper gameWrapper;

void settings() {
  size((int) windowSize.x, (int) windowSize.y);
}

void setup() {
  gameWrapper = new GameWrapper(windowSize);
}

void draw() {
  gameWrapper.render();
}

void mousePressed() {
  gameWrapper.mousePressed(); 
}
