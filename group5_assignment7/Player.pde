boolean wDown = false, aDown = false, sDown = false, dDown = false, spaceDown = false;
int lastShotTime = 0;
int shotCooldown = 150; // in milliseconds

class Player {
  float x, y;
  color shipColor;
  ArrayList<Bullet> bullets;
  float leanOffset = 0;
  int speed;
  Player(float x, float y, color shipColor, int speed) {
    this.x = x;
    this.y = y;
    this.shipColor = shipColor;
    this.speed = speed;
    bullets = new ArrayList<Bullet>();
  }
  
  void update(boolean movementEnabled) {
    if(movementEnabled) {
      if(aDown && !dDown) {
        leanOffset = -10;
      } else if(dDown && !aDown) {
        leanOffset = 10;
      } else {
        leanOffset = 0;
      }
      if(wDown) {
        y -= speed;
      }
      if(sDown) {
        y += speed;
      }
      if(aDown) {
        x -= speed;
      }
      if(dDown) {
        x += speed;
      }
      if(spaceDown) {
        if(millis() - lastShotTime > shotCooldown) {
          bullets.add(new Bullet(x, y - 20));
          lastShotTime = millis();
        }
      }
    for(int i = bullets.size()-1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.update();
      if(b.y < 0) {
        bullets.remove(i);
      }
    }
    }

    x = constrain(x, 10, width - 10);
    y = constrain(y, 10, height - 10);
  }
  
  void displayPlayer() {
    noStroke();
    pushMatrix();
    translate(x, y);
    fill(100);
    beginShape();
    vertex(0,10);
    vertex(-15 + leanOffset/4, 25 - leanOffset/2);
    vertex(15 + leanOffset/4, 25 + leanOffset/2);
    endShape(CLOSE);
    fill(shipColor);
    beginShape();
    vertex(0,-25);
    vertex(-15 + leanOffset/4, 15 - leanOffset/2);
    vertex(15 + leanOffset/4, 15 + leanOffset/2);
    endShape(CLOSE);
    fill(255);
    ellipse(0 + leanOffset/4, -5, 10, 14);
    popMatrix();
    for(Bullet b : bullets) {
      b.display();
    }
  }
  PVector[] getBulletPositions() {
    PVector[] positions = new PVector[bullets.size()];
    for(int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      positions[i] = new PVector(b.x, b.y);
    }
    return positions;
  }
  boolean isWithinBounds(PVector pos) {
    float hitboxWidth = 30;
    float hitboxHeight = 40;
    return abs(pos.x - x) < hitboxWidth/2 && abs(pos.y - y) < hitboxHeight/2;
  }
}
