Spot spot1 = new Spot(50, 50, 15, 10, 10);
Spot spot2 = new Spot(400, 450, 50, -2, -4);

void setup() {
  size(500,500);
  
}

void draw() {
  background(0);
  spot1.display();
  spot1.move();
  spot2.display();
  spot2.move();
}
