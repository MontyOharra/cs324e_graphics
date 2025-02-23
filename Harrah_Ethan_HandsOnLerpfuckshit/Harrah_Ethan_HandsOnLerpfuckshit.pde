void setup() {
  size(700,700); 
}

void draw() {
  float x1 = 0;
  float x2 = width;
  float y1 = 0;
  float y2 = height;
  
  float px1 = lerp(x1, x2, .2);
  float py1 = lerp(y1, y2, .2);
  
  float px2 = lerp(x1, x2, .55);
  float py2 = lerp(y1, y2, .55);
  
  
  point(px1, py1);
  line(px1, py1, px2, py2);
  point(px2, py2);
}


void move(PVector startPos, PVector endPos, float stepSize) {
   pushMatrix();
   translate(lerp(startPos.x, endPos.x, 
}
