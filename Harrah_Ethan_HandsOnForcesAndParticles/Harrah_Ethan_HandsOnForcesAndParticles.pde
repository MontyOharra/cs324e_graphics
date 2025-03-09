import java.util.Random;

Particle[] particles;

void setup() {
  size(600, 600);
  Random rand = new Random();
  particles = new Particle[50];

  // Define a central starting position
  PVector startPos = new PVector(width / 2, height); 

  for (int i = 0; i < 50; i++) {
    // Give each particle a unique velocity
    PVector randVel = new PVector(rand.nextFloat() * 10 - 5, rand.nextFloat() * 10 - 10);
    particles[i] = new Particle(startPos, randVel, 5);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 50; i++) {
    particles[i].display();
    particles[i].moveParticle();
  }
}
