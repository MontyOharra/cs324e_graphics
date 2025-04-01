Firework[] fireworks;
int maxFireworks = 10;
float gravity = 0.03;
float springCoefficient = 0.8;
float dampingCoefficient = 0.2;
int colorScheme = 0;
int debrisCount = 200;

void setup() {
  size(600, 600);
  fireworks = new Firework[maxFireworks];
}

void draw() {
  background(0);
  // Display and update only the maximum amount at a given time.
  for (int i = 0; i < maxFireworks; i++) {
    if (fireworks[i] != null) {
      fireworks[i].display();
      if (fireworks[i].isDone()) {
        fireworks[i] = null;
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < maxFireworks; i++) {
    if (fireworks[i] == null) {
      fireworks[i] = new Firework(mouseX, mouseY); // add one new firework upon clicking
      break;
    }
  }
}

void keyPressed() {
  if (key == '1') {
    colorScheme = 0;  // Blue squares, Green stars
  } else if (key == '2') {
    colorScheme = 1;  // Red squares, Orange stars
  } else if (key == '3') {
    colorScheme = 2;  // Yellow squares, Pink stars
  }
}
