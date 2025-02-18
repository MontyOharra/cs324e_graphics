
Field field;

GrassPatch[] patches;
boolean swayRight;
float sway;

void setup() {
  size(500,500); 
  field = new Field(50, color(0,255,0), 1, .5);
  swayRight = true;
  sway = 0;
}

void draw() {
  background(0);
    field.render(sway);
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
}
