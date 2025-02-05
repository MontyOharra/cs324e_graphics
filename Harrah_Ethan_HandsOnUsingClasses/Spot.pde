class Spot {
  float x;
  float y;
  float speedX;
  float speedY;
  float radius;
  
  Spot(float initX, float initY, float radius, float speedX, float speedY) {
    this.x = initX;
    this.y = initY;
    this.radius = radius;
    this.speedX = speedX;
    this.speedY = speedY;
  }

  void display() {
     circle(this.x, this.y, this.radius); 
  }
  
  void move() {
    this.x += this.speedX; 
    this.y += this.speedY;
  }
  
}
