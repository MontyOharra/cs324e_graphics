class CampFire {
  float x;
  float y;
  float scale = 1;
  float flickerSpeed;
  color c;
  
  
  CampFire(float x, float y, float flickerSpeed, color c) {
    this.x = x;
    this.y = y;
    this.flickerSpeed = flickerSpeed;
    this.c = c;
  }
  
  void flicker() {
    scale = 1.0 + sin(frameCount * flickerSpeed) * 0.1;
    x =  sin(frameCount * 0.1) * 5;
  }
  
  void display() {
    //wood
    noStroke();
    rectMode(CENTER);
    fill(59, 50, 10);
    rect(width/2, height/2 + 30, 70, 30);
    
    //flame
    pushMatrix();
    translate(width/2, height/2);
    translate(x, y);
    fill(c);
    ellipse(0, 0, 50, 50); 
  
    pushMatrix();
    translate(0, -30);
    scale(scale);
    fill(c);
    triangle(-15, 10, 15, 10, 0, -30);
    popMatrix();
  
    popMatrix();
  }
}
