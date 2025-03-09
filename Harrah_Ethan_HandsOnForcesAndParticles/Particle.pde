class Particle {
 PVector pos;
 PVector vel;
 float r;
  
 Particle(PVector initPos, PVector initVel, float r) {
   this.pos = initPos.copy();
   this.vel = initVel;
   this.r = r;
 }
 
 void applyForces(PVector force) {
   this.vel.x += force.x;
   this.vel.y += force.y;
 }

  void moveParticle() {
    this.pos.x += this.vel.x;
    this.pos.y += this.vel.y;
    
    if (this.pos.x < 0 || this.pos.x > width) {
      this.vel.x *= -1; 
    }
    if (this.pos.y < 0 || this.pos.y > height) {
      this.vel.y *= -1; 
    }    
  }
  
  void display() {
    circle(this.pos.x, this.pos.y, this.r); 
  }
}
