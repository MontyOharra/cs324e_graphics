void setup() {
 size(500,500);  
}

void draw() {
  fill(0);
  pushMatrix();
  translate(250,250);
  rect(0,0,20,30);
  popMatrix();
  
  fill(100);
  pushMatrix();
  scale(4);
  translate(50,25);
  rect(0,0,20,30);
  popMatrix();
  
  fill(200);
  pushMatrix();
  rotate(PI/4);
  translate(100,0);
  rect(0,0,20,30);
  popMatrix();
  
  fill(255);
  pushMatrix();
  translate(100,0);
  rotate(PI/4);
  rect(0,0,20,30);
  popMatrix();
  
  fill(color(255,0,0));
  
  pushMatrix();
  translate(400,400);
  scale(5);
  ellipse(0,0,20,10);
  pushMatrix();
  rotate(PI/3);
  translate(-10,0);
  scale(.5);
  rect(0,0,15,3);
  popMatrix();
  popMatrix();
}
