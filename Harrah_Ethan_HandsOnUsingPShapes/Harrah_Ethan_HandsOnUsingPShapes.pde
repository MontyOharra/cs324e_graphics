void setup() {
  size(500,400); 
}

void draw() {
  beginShape();
    vertex(50,50);
    vertex(100,50);
    vertex(125,75);
    vertex(100,100);
    vertex(50,100);
  endShape(CLOSE);
  
  beginShape(TRIANGLE_STRIP);
    vertex(150,50);
    vertex(200,50);
    vertex(225,75);
    vertex(200,100);
    vertex(150,100);
  endShape(CLOSE);
  
  beginShape();
    curveVertex(250,50);
    curveVertex(300,50);
    curveVertex(325,75);
    curveVertex(300,100);
    curveVertex(250,100);
  endShape(CLOSE);
  PShape myShape = createShape();
  myShape.beginShape();
    myShape.vertex(50,50);
    myShape.vertex(100,50);
    myShape.vertex(125,75);
    myShape.vertex(100,100);
    myShape.vertex(50,100);
  myShape.endShape(CLOSE);
  shape(myShape,0,200);
  
  PShape s = createShape(GROUP);
  PShape e = createShape(ELLIPSE, 250, 75, 100, 25);
  PShape r = createShape(RECT, 250, 50, 100, 50);
  s.addChild(e);
  s.addChild(r);
  shape(s, 0, 200);
}
