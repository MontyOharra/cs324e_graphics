class Star {
  float x, y;
  float vx, vy;
  float opacity;
  float r;
  float g;
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
    this.vx = 7;
    this.vy = random(-1, 1);
    this.opacity = 255;
    this.r = random(5, 7);
    this.g = 0.1;
  }
  
  void display() {
    noStroke();
    fill(color(255, 250 ,175, opacity));
    ellipse(x, y, r, r);
    // decreasing opacity and size
    r -= .2;
    opacity -= .5;
  }
  
  void applyForces() {
    // applying gravity
    vy += g;
    
    x += vx;
    y += vy;
  }
}
