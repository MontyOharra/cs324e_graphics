class CampFire {
  float x;
  float y;
  float flameX;
  float flameY;
  float scale = 1;
  float flickerSpeed;
  color c;
  
  CampFire(float x, float y, float flameX, float flameY, float flickerSpeed, color c) {
    this.x = x;
    this.y = y;
    this.flameX = flameX;
    this.flameY = flameY;
    this.flickerSpeed = flickerSpeed;
    this.c = c;
  }
  
  void flicker(float sway) {
    this.scale = 1.0 + sin(frameCount * flickerSpeed) * 0.1;
    this.flameX = sway;
  }
  
  void display() {
    //wood
    noStroke();
    rectMode(CENTER);
    fill(59, 50, 10);
    rect(this.x, this.y, 70, 30);
    
    //flame
    pushMatrix();
    translate(this.x, this.y);
    translate(this.flameX, this.flameY);
    fill(this.c);
    ellipse(0, 0, 50, 50); 
  
    pushMatrix();
    translate(0, -30);
    scale(this.scale);
    fill(this.c);
    triangle(-15, 10, 15, 10, 0, -30);
    popMatrix();
  
    popMatrix();
  }
}
