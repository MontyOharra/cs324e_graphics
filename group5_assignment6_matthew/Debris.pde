class Debris {
  PVector position, velocity, acceleration, reference;
  float lifespan, mass;
  boolean isSquare;
  float angle, angularVelocity;
  color fillColor;

  Debris(float x, float y, boolean square) {
    // Initialize debris at position, with random velocity vector, and acceleration of gravity.
    position = new PVector(x, y);
    reference = new PVector(x, y);
    float angle = random(2*PI);
    float speed = random(2, 4);
    velocity = new PVector(cos(angle) * speed, sin(angle) * speed);
    acceleration = new PVector(0, gravity);
    
    // Specify how long debris lasts and its mass.
    lifespan = 150;
    mass = random(1, 3);
    
    // If its shape is square, it will spin randomly.
    isSquare = square;
    this.angle = random(2*PI);
    angularVelocity = random(-0.1, 0.1);
    updateColor();
  }

  void applyForce(PVector force) {
    PVector a = PVector.div(force, mass); 
    acceleration.add(a);
  }

  void update() {
    if (lifespan == 70) {
      // Oscillate around set reference position after firework explodes.
      reference.x = position.x;
    }
    if (lifespan <= 70) { 
      float springForce = -springCoefficient * (position.x - reference.x); 
      float dampingForce = -dampingCoefficient * velocity.x;
      float springAccel = (springForce + dampingForce) / mass;
      acceleration.x += springAccel; // Add spring and damping effects to x direction.
    }
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); // Reset acceleration to prevent force accumulation.
    lifespan -= 2;
    angle += angularVelocity;
  }

  void drawStar(float x, float y, float rad1, float rad2, int points) {
    // Create a star shape.
    float angle = (2*PI) / points;
    float halfAngle = angle / 2.0;
    
    beginShape();
    for (float a = -PI / 2; a < (2*PI) - PI / 2; a += angle) {
      float sx = x + cos(a) * rad2;
      float sy = y + sin(a) * rad2;
      vertex(sx, sy);
      sx = x + cos(a + halfAngle) * rad1;
      sy = y + sin(a + halfAngle) * rad1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void updateColor() {
    if (colorScheme == 0) {
      // Blue squares, Green stars
      if (isSquare) {
        fillColor = color(0, 0, 255); 
      } else {
        fillColor = color(0, 255, 0); 
      }
    } else if (colorScheme == 1) {
      // Red squares, Orange stars
      if (isSquare) {
        fillColor = color(255, 0, 0);
      } else {
        fillColor = color(255, 165, 0); 
      }
    } else {
      // Yellow squares, Pink stars
      if (isSquare) {
        fillColor = color(255, 255, 0);
      } else {
        fillColor = color(255, 105, 180);
      }
    }
  }

  void display() {
    fill(fillColor, lifespan); // lifespan acts as transparency value.
    noStroke();
    
    if (isSquare) {
      // Draw spinning square debris.
      pushMatrix();
      translate(position.x, position.y);
      rotate(angle);
      rectMode(CENTER);
      rect(0, 0, 8, 8);
      popMatrix();
    } else {
      // Draw star debris.
      drawStar(position.x, position.y, 4, 8, 5);
    }
  }

  boolean isDone() {
    return lifespan < 0; // Return whether debris has disappeared.
  }
}
