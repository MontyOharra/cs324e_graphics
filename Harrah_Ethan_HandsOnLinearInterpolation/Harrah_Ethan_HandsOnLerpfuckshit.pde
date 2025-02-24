float currStepAmount;

void setup() {
  size(700,700); 
  currStepAmount = 0;
}

void draw() {
  background(255);
  PVector startPos = new PVector(200,100);
  PVector endPos = new PVector(500, 300);
  
  PVector currLerpPos = move(startPos, endPos, .01);
  line(startPos.x, startPos.y, currLerpPos.x, currLerpPos.y);
}


PVector move(PVector startPos, PVector endPos, float stepSize) {
   currStepAmount += stepSize;
   if (currStepAmount > 1) {
     currStepAmount = 0;
   }
   print(currStepAmount + "   ");
   float x = lerp(startPos.x, endPos.x, currStepAmount);
   float y = lerp(startPos.y, endPos.y, currStepAmount);
   return new PVector(x, y);
}
