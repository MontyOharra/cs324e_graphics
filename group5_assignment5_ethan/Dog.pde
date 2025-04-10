class Dog {
  float xPos;
  float yPos;
  float zPos;
  
  float bodyXLen;
  float bodyYLen;
  float bodyZLen;
  
  float legSwing = 0;
  
  boolean swingForward;
  
  Dog(float xInit, float yInit, float zInit) {
    this.xPos = xInit;
    this.yPos = yInit;
    this.zPos = zInit;
    
    this.bodyXLen = 80;
    this.bodyYLen = 30;
    this.bodyZLen = 30;
    
    this.swingForward = false;
  }
  
  void render() {
    fill(100,57,20);
    pushMatrix();
    translate(this.xPos, this.yPos, this.zPos);
    box(this.bodyXLen, this.bodyYLen, this.bodyZLen);
    this.renderLegs();
    fill(80,47,20);
    this.renderHead();
    popMatrix();
  }
  
  void move() {
    this.xPos += 1; 
    if (swingForward == true) {
      this.legSwing += .04;
      if (this.legSwing > PI/3) {
        this.swingForward = false; 
      }
    } else {
      this.legSwing -= .04;
      if (this.legSwing < -PI/3) {
        this.swingForward = true; 
      }
    }
  }
  
  void renderLegs() {
    // Front right leg
    pushMatrix();
    translate(this.bodyXLen / 2 - 5, this.bodyYLen / 2 - 5, -this.bodyZLen / 2);
    
    rotateY(-legSwing);
    rotateX(-PI/2);
    
    translate(0, 15, 0);
    
    box(10, 30, 10);
    popMatrix();
    
    // Front left leg
    pushMatrix();
    translate(this.bodyXLen / 2 - 5, -this.bodyYLen / 2 + 5, -this.bodyZLen / 2);
    
    rotateY(-legSwing);
    rotateX(-PI/2);
    
    translate(0, 15, 0);
    
    box(10, 30, 10);
    popMatrix();
    
    // Back left leg
    pushMatrix();
    translate(-this.bodyXLen / 2 + 5, -this.bodyYLen / 2 + 5, -this.bodyZLen / 2);
    
    rotateY(legSwing);
    rotateX(-PI/2);
    
    translate(0, 15, 0);
    
    box(10, 30, 10);
    popMatrix();
    
    // Back right leg
    pushMatrix();
    translate(-this.bodyXLen / 2 + 5, this.bodyYLen / 2 - 5, -this.bodyZLen / 2);
    
    rotateY(legSwing);
    rotateX(-PI/2);
    
    translate(0, 15, 0);
    
    box(10, 30, 10);
    popMatrix();
  }
  
  void renderHead() {
    noStroke();
    pushMatrix();
    translate(this.bodyXLen / 2 + 5, 0, 20);
    sphere(10);
    popMatrix();
  }
}
