class Spot {
  private PVector speed;
  private PVector position;
  private float radius;
  private float elasticity;
  
  Spot(float initPosX, float initPosY, float initSpeedX, float initSpeedY, float radius) {
    this.speed = new PVector(initSpeedX, initSpeedY);
    this.position = new PVector(initPosX, initPosY);
    this.elasticity = 1;
    this.radius = radius;
  }

  void display() {
     
     circle(this.position.x, this.position.y, this.radius); 
  }
  
  void move() {   
    if (this.position.x - radius < 0 || this.position.x + radius > width) {
      this.speed.x *= -1 * this.elasticity;
    }
    if (this.position.y - radius < 0 || this.position.y + radius > height) {
      this.speed.y *= -1 * this.elasticity;
    }
    this.position.x += this.speed.x; 
    this.position.y += this.speed.y;
    

  }
  
}
