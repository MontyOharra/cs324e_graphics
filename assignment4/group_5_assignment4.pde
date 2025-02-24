import ddf.minim.*;

Minim minim;
AudioPlayer birdSound;

CampFire campfire1, campfire2;

Field field;

GrassPatch[] patches;
boolean swayRight;
float sway;
Bird bird1;
Bird bird2;

void setup() {
  size(600, 600);
  campfire1 = new CampFire(0, -10, .1, color(250, 50, 0));
  campfire2 = new CampFire(50, 10, .5, color(250, 180, 0));

  bird1 = new Bird(350, 50, 1.5, 0.1, -1, -0.8);
  bird2 = new Bird(50, 200, 1, 0.2, 1, 0.5);
  field = new Field(50, color(0,255,0), 1, .5);
  swayRight = true;
  sway = 0;  
 minim = new Minim(this);
 birdSound = minim.loadFile("birdsound.mp3");
 birdSound.play();
}

void draw() {
  background(255);
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
  // CAMPFIRE
  campfire1.flicker();
  campfire1.display();
  
  campfire2.flicker();
  campfire2.display();
  
  bird1.fly();
  bird1.flap();
  bird1.display();
  
  bird2.fly();
  bird2.flap();
  bird2.display();
}
