class Dog {
  float xPos;
  float yPos;
  float zPos;
  
  float bodyXLen;
  float bodyYLen;
  float bodyZLen;
  
  Dog(float xInit, float yInit, float zInit) {
    this.xPos = xInit;
    this.yPos = yInit;
    this.zPos = zInit;
    
    this.bodyXLen = 80;
    this.bodyYLen = 50;
    this.bodyZLen = 40;
  }
  
  void render() {
    pushMatrix();
    translate(this.xPos, this.yPos, this.zPos);
    box(this.bodyXLen, this.bodyYLen, this.bodyZLen);
    popMatrix();
  }
  
  void move() {
    this.xPos += 1; 
  }
  
  void renderLegs() {
    
    // Front right leg
    pushMatrix();
    translate(this.bodyXLen / 2, this.bodyYLen / 2, 
    
  }
}
