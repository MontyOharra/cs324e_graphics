class Enemy {
  float x, y;
  float speed;
  int shootCooldown; // time between shots
  int lastShotTime; // time of the last shot
  ArrayList<EnemyBullet> bullets;

  Enemy(float startX, float startY, float startSpeed) {
    x = startX;
    y = startY;
    speed = startSpeed;
    shootCooldown = 1200; // milliseconds between shots
    lastShotTime = millis();
    bullets = new ArrayList<EnemyBullet>();
  }

  void move() {
    y += speed;
  }

  void displayEnemy() {
    fill(255, 0, 0);
    noStroke();
    rect(x - 15, y - 10, 30, 20); // basic rectangle spaceship
  }

  void shoot(Player player) {
    if (millis() - lastShotTime > shootCooldown) {
      bullets.add(new EnemyBullet(x, y));
      lastShotTime = millis();
    }
  }

  void updateBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      bullets.get(i).move();
      bullets.get(i).display();
      if (bullets.get(i).isOffScreen()) {
        bullets.remove(i);
      }
    }
  }

  ArrayList<EnemyBullet> getBullets() {
    return bullets;
  }

  boolean isHit(Bullet b) {
    return dist(x, y, b.x, b.y) < 15; // simple collision detection
  }
}

class EnemyBullet {
  float x, y;
  float speed = 5;

  EnemyBullet(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void move() {
    y += speed;
  }

  void display() {
    fill(255, 255, 0);
    ellipse(x, y, 5, 10);
  }

  boolean isOffScreen() {
    return y > height;
  }
}
