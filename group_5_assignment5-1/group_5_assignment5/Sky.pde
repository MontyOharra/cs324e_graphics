class Sky {
  PVector sunPos;
  float sunSpeed;
  ArrayList<Cloud> clouds;
  int numClouds = 5;

  Sky() {
    sunPos = new PVector(-200, 50, 0);
    sunSpeed = 1.5;
    clouds = new ArrayList<Cloud>();

    // Initialize clouds with random speeds and positions
    for (int i = 0; i < numClouds; i++) {
      float x = random(-400, 400);
      float y = random(50, 150); 
      float z = random(-200, 200);
      float speed = random(0.5, 2.0);
      clouds.add(new Cloud(x, y, z, speed));
    }
  }

  void update() {
    // Move the sun
    sunPos.x += sunSpeed;
    if (sunPos.x > width + 200) {
      sunPos.x = -200; 
    }
    for (Cloud cloud : clouds) {
      cloud.update();
    }
  }

  void display() {
    pushMatrix();
    translate(sunPos.x, sunPos.y, sunPos.z);
    fill(255, 204, 0);
    noStroke();
    sphere(40); 
    popMatrix();

    for (Cloud cloud : clouds) {
      cloud.display();
    }
  }
}

class Cloud {
  PVector pos;
  float speed;
  float rotationAngle;

  Cloud(float x, float y, float z, float speed) {
    this.pos = new PVector(x, y, z);
    this.speed = speed;
    this.rotationAngle = random(0, TWO_PI); 
  }

  void update() {
    pos.x += speed;
    if (pos.x > width + 100) {
      pos.x = -100; // Reset cloud position
    }
    
    // Add slight rotation for secondary animation
    rotationAngle += 0.01;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(rotationAngle);
    fill(200);
    noStroke();
    sphere(25);
    translate(15, 5, 0);
    sphere(25);
    translate(-30, 0, 0);
    sphere(25);
    popMatrix();
  }
}
