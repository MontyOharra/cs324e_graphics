void setup() {
 size(500, 500, P3D);
 noStroke();
}
void draw() {
 background(0);
 directionalLight(200, 200, 100, 0, -1, -1);
 ambientLight(100,100,0,-100,0,0);
 spotLight(
   0,255,0,
   width/2,-300, 400,
   width/2,height/2,10,
   PI/2,
   .001);
 
 pointLight(0,0,255, 400, 400, 200);
 translate(width/2, height/2, 0);
 sphere(50);
 translate(100,100,-100);
 rotate(PI/3);
 box(50,50,50);
}
