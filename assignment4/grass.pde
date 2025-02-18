

GrassPatch[] patches;
boolean swayRight;
float sway;
/*
void setup() {
  size(500,500); 
  Random rand = new Random();
  patches = new GrassPatch[5];
  for (int i = 0; i < 5; i++) {
    GrassPatch patch = new GrassPatch(250 + rand.nextFloat()*200 - 100, 250 + rand.nextFloat()*200 - 100, 15, 150, 4, 40, 3); 
    patches[i] = patch;
  }
  swayRight = true;
  sway = 0;
}

void draw() {
  background(0);
  for (int i = 0; i < patches.length; i++) {
    GrassPatch patch = patches[i]; 
    patch.setSway(sway);
    patch.display();
  }
  if ( swayRight == true ) {
    sway += 1;
    if (sway > 30) {
      swayRight = false; 
    }
  } else {
    sway -= 1;
    if (sway < -30) {
      swayRight = true; 
    }
  }
}*/
