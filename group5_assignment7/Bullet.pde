class Bullet {
  // Class creates the bullet objects.
  float x, y;
  float speed = 7;

  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= speed;
  }

  void display() {
    // Display red bullets
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 6, 12);
  }
}
