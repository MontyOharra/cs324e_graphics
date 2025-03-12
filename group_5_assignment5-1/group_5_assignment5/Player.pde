class Player {
  PVector pos;
  PVector dir;
  float speed;
  float ballSpeed;
  float angle;
  float legAngle;
  boolean legSwingingForward;

  // Constructor to initialize the player.
  Player(float x, float y, float z, float speed, float ballSpeed, float dirX, float dirY, float dirZ) {
    this.pos = new PVector(x, y, z);
    this.dir = new PVector(dirX, dirY, dirZ).normalize();
    this.speed = abs(speed);
    this.ballSpeed = abs(ballSpeed);
    this.angle = 0;
    this.legAngle = 0;
    this.legSwingingForward = true;
  }  

  // Update the position of the player object, accounting for the bounds of the canvas.
  void move() {
    pos.add(PVector.mult(dir, speed));
    // Swing leg back and forth
    if (legSwingingForward) {
      legAngle += 0.02;
      if (legAngle > 0.5) legSwingingForward = false;
    } else {
      legAngle -= 0.02;
      if (legAngle < -0.5) legSwingingForward = true;
    }
    
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
    if (pos.z > 500) {
      pos.z = -200;
    }
    if (pos.z < -200) {
      pos.z = 500;
    }
  }
  
  // Increment angle for spinning ball.
  void spinBall() {
    angle += ballSpeed; 
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    
    // Draw the legs with rotation
    pushMatrix();
    fill(0, 0, 255);
    translate(0, 25, 15); 
    rotateZ(legAngle); 
    box(25, 50, 10); 
    popMatrix(); 
    pushMatrix();
    fill(0, 0, 255);
    translate(0, 25, -15); 
    rotateZ(-legAngle); 
    box(25, 50, 10); 
    popMatrix();
    
    // Draw the torso
    pushMatrix();
    fill(255, 0, 0);
    translate(0, -25, 0); 
    box(30, 50, 50);
    popMatrix();
    
    // Draw the head
    pushMatrix();
    fill(255, 255, 0);
    translate(0, -70, 0); 
    sphere(25);
    popMatrix(); 
    
    // Draw the spinning ball
    pushMatrix();
    rotateY(angle); 
    translate(60, -25, 0); 
    fill(255, 165, 0);
    sphere(20);
    popMatrix(); 
    
    popMatrix(); 
  }
}
