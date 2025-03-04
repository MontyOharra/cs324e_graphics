PVector oscCoords;
PVector circleCoords;
PVector easeOutCoords;
PVector easeInCoords;

float oscT;
float circleT;
float easeOutT;
float easeInT;

float globalTimeStep = 0.01;

void setup() {
  size(800, 800);
  
  oscCoords = new PVector(100, 100);
  circleCoords = new PVector(100, 300);
  easeOutCoords = new PVector(100, 500);
  easeInCoords = new PVector(100, 700);
  
  oscT = 0;
  circleT = 0;
  easeOutT = 0;
  easeInT = 0;
}

void draw() {
  background(0);
  fill(255);
  circle(oscCoords.x, oscCoords.y, 25);
  fill(255,0,0);
  circle(circleCoords.x, circleCoords.y, 25);
  fill(0,255,0);
  circle(easeOutCoords.x, easeOutCoords.y, 25);
  fill(0,0,255);
  circle(easeInCoords.x, easeInCoords.y, 25); 
  
  moveOsc();
  moveCircle();
  moveEaseOut();
  moveEaseIn();
}

void moveOsc() {
  oscT += globalTimeStep;
  oscCoords.x = 300*sin(oscT) + 400;
}

void moveCircle() {
  circleT += globalTimeStep;
  circleCoords.x = 100*sin(oscT) + 350;
  circleCoords.y = 100*cos(oscT) + 300;
}

void moveEaseOut() {
  easeOutT += globalTimeStep;
  if (easeOutT > 1) {easeOutT = 0;}
  easeOutCoords.x = 600*sin(easeOutT * PI / 2) + 100;
}

void moveEaseIn() {
  easeInT += globalTimeStep;
  if (easeInT > 1) {easeInT = 0;}
  easeInCoords.x = 600*(1 - cos(easeInT * PI / 2)) + 100;
}
