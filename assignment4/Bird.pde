class Bird {
  PVector pos;
  PVector dir;
  float speed;
  float wingAngle;
  float wingSpeed;
  boolean wingUp;
  PShape wing;
  PShape body;
  PShape head;
  PShape beak;

  // Constructor to initialize the bird.
  Bird(float x, float y, float speed, float wingSpeed, float dirX, float dirY) {
    this.pos = new PVector(x, y);
    this.dir = new PVector(dirX, dirY).normalize();
    this.speed = abs(speed);
    this.wingSpeed = abs(wingSpeed);
    wingAngle = 0;
    wingUp = true;
    
    // Create the PShapes facing the correct direction.
    fill(75, 190, 80);
    body = createShape(ELLIPSE, 0, 0, 40, 20);
    if (dir.x > 0) {
      head = createShape(ELLIPSE, 15, -10, 20, 20);
      fill(255, 165, 0);
      beak = createShape(TRIANGLE, 25, -10, 33, -7, 25, -4);
      fill(55, 150, 50);
      wing = createShape(ELLIPSE, -10, 0, 25, 10);
    } else {
      head = createShape(ELLIPSE, -15, -10, 20, 20);
      fill(255, 165, 0);
      beak = createShape(TRIANGLE, -25, -10, -33, -7, -25, -4);
      fill(55, 150, 50);
      wing = createShape(ELLIPSE, 10, 0, 25, 10);
    }
  }    
  
  // Fly() method will make the bird move across the screen.
  void fly() {
    pos.add(PVector.mult(dir, speed));
    // If the bird moves outside the canvas, reset the position accordingly.
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
  }
  
  // Flap() method will make the wings move up and down.
  void flap() {
    if (wingUp) {
      wingAngle += wingSpeed;
      if (wingAngle > PI / 6) wingUp = false;
    } else {
      wingAngle -= wingSpeed;
      if (wingAngle < -PI / 6) wingUp = true;
    }
  }
  
  // Display() method will visualize the bird.
  void display() {
    // Display the main animation of the bird flying.
    pushMatrix();
    translate(pos.x, pos.y);
    shape(body);
    shape(head);
    shape(beak);
    
    // Display the sub animation of the wing flapping
    pushMatrix();
    rotate(wingAngle);
    shape(wing);
    popMatrix();
    popMatrix();
  }
}
