void setup() {
   background(255);
   size(650,700);
   
   strokeWeight(2);
   
   fill(0,125,255);
   stroke(0);
   square(50,100,100);
   
   noStroke();
   square(200,100,100);
   
   noFill();
   square(350,100,100);
   
   stroke(0);
   square(500,100,100);
   
   rect(50,350,250,100);
   
   ellipse(475,400,250,100);
   
   fill(100);
   rectMode(CENTER);
   rect(50,350,250,100);
   
   ellipseMode(CORNER);
   ellipse(475,400,250,100);
   
   ellipseMode(CENTER);
   
   for (int i = 0; i < 30; i++) {
     fill(i*10);
     circle(350 - i*1.5,600, 75 - 2*i);
   }
  
}
