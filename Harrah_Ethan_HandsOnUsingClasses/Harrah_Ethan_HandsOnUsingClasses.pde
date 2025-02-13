import java.util.Random;

int numSpots = 50;
Spot[] spots = new Spot[numSpots];

void setup() {
  size(500,500);
  Random rand = new Random();
 
  float maxSpeed = 2;
 
  for (int i = 0; i < numSpots; i++) {
    float radius = rand.nextFloat() * 50 + 5;
    Spot spot = new Spot(  rand.nextFloat() * (width - 2*radius) + radius,  rand.nextFloat() * (height - 2*radius) + radius,  rand.nextFloat() * maxSpeed,  rand.nextFloat() * maxSpeed, radius);
    spots[i] = spot;
  }
}

void draw() {
  background(0);
  for (Spot spot : spots) {
    spot.display();
    spot.move();
  }
}
