Firework[] fireworks;
int maxFireworks = 10;
float gravity = 0.03;
float springCoefficient = 0.8;
float dampingCoefficient = 0.2;
int colorScheme = 0;
int debrisCount = 200;

Cloth cloth;
ArrayList<PVector> clothBounds;

void setup() {
  size(900, 700);
  fireworks = new Firework[maxFireworks];
  
  clothBounds = new ArrayList();
  clothBounds.add(new PVector(100, 100));
  clothBounds.add(new PVector(100, 600));
  clothBounds.add(new PVector(800, 600));
  clothBounds.add(new PVector(800, 100));
  
  cloth = new Cloth(
    clothBounds,
    5,
    .1,
    .5,
    .5
  );
}

void draw() {
  background(100);
  cloth.render(); 
  cloth.calculateNextStep();
  // Display and update only the maximum amount at a given time.
  for (int i = 0; i < maxFireworks; i++) {
    if (fireworks[i] != null) {
      fireworks[i].display();
  
      if (fireworks[i].isDone()) {
        fireworks[i] = null;
      } else {
        // Fix is here — use an indexed loop so we can remove debris properly
        for (int j = 0; j < fireworks[i].debrisList.length; j++) {
          Debris debris = fireworks[i].debrisList[j];
          if (debris != null && cloth.isPointOnCloth(debris.position.x, debris.position.y)) {
            cloth.setFire(debris.position.x, debris.position.y);
            fireworks[i].debrisList[j] = null;  // Now we actually remove it
          }
        }
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
