void setup() {
 size(500, 500, P3D); 
 noStroke();
}

void draw() {
 background(0);
  
 fill(0, 51, 200);
 
 lightSpecular(204, 204, 204); 
 specular(255, 255, 255);
 
 directionalLight(210, 210, 210, -1, 0, 0.0);
 pointLight(255, 255, 255, 350, 350, 50);
 spotLight(255, 255, 255, 350, 350, 50, -1, 0, 0, PI, 1);
 ambientLight(102, 102, 102);
     
 translate(width/2, height/2, 0);
 ambient(40, 200, 40);
 shininess(5.0);
 sphere(75);

 lightSpecular(204, 40, 40); 
 specular(255, 0, 0);
 
 translate(width/2, height/2, 0);
 shininess(20.0);
 ambient(200, 40, 40);
 sphere(100);
 

}
