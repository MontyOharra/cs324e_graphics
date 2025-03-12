class Tree {
  float x, y, z;
  float angle = map(sin(frameCount * .05), -1, 1, PI/8, PI/3);
  
  Tree(float x , float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void display() {
    translate(x, y, z);
    
    // stump
    fill(70, 70, 0);
    box(20, 150, 20);
    
    // branch and leaves on right
    
    pushMatrix();
    translate(0, -50, 0);
    rotate(angle);
    translate(0, -25, 0);
    box(15, 60, 15);
    
    pushMatrix();
    translate(-10, -50, 0);
    fill(10, 180, 30);
    sphere(40);
 
    popMatrix();
    popMatrix();
    
    // branch and leaves on left
    pushMatrix();
    translate(0, -70, 0);
    rotate(angle+30);
    translate(0, -25, 0);
    fill(70, 70, 0);
    box(15, 60, 15);
    
    pushMatrix();
    translate(-10, -45, 0);
    fill(10, 180, 30);
    sphere(55);
 
    popMatrix();
    popMatrix();
  }
}
