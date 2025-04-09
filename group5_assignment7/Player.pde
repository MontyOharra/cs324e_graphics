class Player {
  float x, y;
  color shipColor;
  ArrayList<Bullet> bullets;
  float leanOffset = 0;

  Player(float x, float y, color shipColor) {
    this.x = x;
    this.y = y;
    this.shipColor = shipColor;
    bullets = new ArrayList<Bullet>(); // Store active bullets in an ArrayList.
  }
  /*
  void move() {
    float speed = 5;
    leanOffset = 0;  // reset lean each frame
  
    if (wDown) y -= speed;
    if (sDown) y += speed;
    if (aDown) {
      x -= speed;
      leanOffset = -10; // lean left
    }
    if (dDown) {
      x += speed;
      leanOffset = 10; // lean right
    }
    
    // Keep the player within the screen
    x = constrain(x, 10, width - 10);
    y = constrain(y, 10, height - 10);
  }


  void shoot() {
    // Hold spacebar for continuous shooting
    if (spaceDown) {
      if (millis() - lastShotTime > shotCooldown) {
        bullets.add(new Bullet(x, y - 20));
        lastShotTime = millis();
      }
    }

    // Update and remove bullets
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.update();
      if (b.y < 0) {
        bullets.remove(i);
      }
    }
  }

  void displayPlayer() {
    // Use leanOffset to display the ship leaning towards the direction it flies.
    noStroke();
    pushMatrix();
    translate(x, y);
    
    // Draw thruster
    fill(100);
    beginShape();
    vertex(0, 10);                  
    vertex(-15 + leanOffset/4, 25 - leanOffset/2);  
    vertex(15 + leanOffset/4, 25 + leanOffset/2);   
    endShape(CLOSE);
    
    // Draw spaceship hull
    fill(shipColor);
    beginShape();
    vertex(0, -25);                  
    vertex(-15 + leanOffset/4, 15 - leanOffset/2);  
    vertex(15 + leanOffset/4, 15 + leanOffset/2);   
    endShape(CLOSE);
    
    // Draw cockpit
    fill(255);  
    ellipse(0 + leanOffset/4, -5, 10, 14);
    popMatrix();
  
    // Draw bullets
    for (Bullet b : bullets) {
      b.display();
    }
  }


  PVector[] getBulletPositions() {
    // Return the positions of the bullets to track if they collide with other objects.
    PVector[] positions = new PVector[bullets.size()];
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      positions[i] = new PVector(b.x, b.y);
    }
    return positions;
  }
  */
}
