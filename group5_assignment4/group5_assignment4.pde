import ddf.minim.*;

Minim minim;
AudioPlayer birdSound;

float sway;

CampFire campfire1, campfire2;
Field field;
GrassPatch[] patches;
Bird bird1;
Bird bird2;

void setup() {
  size(600, 600);
  minim = new Minim(this);
  birdSound = minim.loadFile("birdsound.mp3");
  birdSound.play();
  float campfireX = 500;
  
  float campfireY = 500;
  sway = 0;  
  
  campfire1 = new CampFire(campfireX, campfireY, 0, -60, .1, color(250, 50, 0));
  campfire2 = new CampFire(campfireX, campfireY, 0, -50, .5, color(250, 180, 0));
  bird1 = new Bird(350, 50, 1.5, 0.1, -1, -0.8);
  bird2 = new Bird(50, 200, 1, 0.2, 1, 0.5);
  field = new Field(100.0, color(0,255,0), campfireX, campfireY, .45);
}

void draw() {
  background(135, 206, 235);
  sway = 10*sin(frameCount * 0.1) - 5;
  
  field.renderBase();
  campfire1.flicker(sway);
  campfire2.flicker(sway);
  campfire1.display();
  campfire2.display();
  field.renderGrass(sway);
  
  bird1.fly();
  bird1.flap();
  bird1.display();
  
  bird2.fly();
  bird2.flap();
  bird2.display();
}
