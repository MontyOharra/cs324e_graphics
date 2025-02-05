import java.util.Map;

int maxLuminosity = 50;
float luminosityChangeSpeed = .2;
int daySkyRed = 135;
int daySkyGreen = 206;
int daySkyBlue = 235;
int nightSkyRed = 25;
int nightSkyGreen = 25;
int nightSkyBlue = 112;

Map<String, Integer> colors = new HashMap<>();
boolean brighten;
float currLuminosity;
int skyRedValue;
int skyBlueValue;
int skyGreenValue;

void setup() {
  size(1000,800);
  background(0);
  
  colors.put("white", color(255));
  colors.put("black", color(0));
  colors.put("sunYellow", color(255, 223, 0));
  colors.put("treeTrunkBrown", color(139, 69, 19));
  colors.put("leafGreen", color(34, 139, 34));
  colors.put("grassGreen", color(124, 252, 0));
  colors.put("hillGreen", color(85, 107, 47));
  colors.put("darkBrown", color(109, 59, 19));
  
  brighten = true;
  currLuminosity = 1;

}

void draw() {

  if (brighten == true) {
     currLuminosity += luminosityChangeSpeed; 
     if (currLuminosity > maxLuminosity) {
        brighten = false; 
     }
  } else {
     currLuminosity -= luminosityChangeSpeed; 
     if (currLuminosity <= 1) {
        brighten = true; 
     }
  }
  setSkyColor(currLuminosity);
  drawSun(100,100,currLuminosity);
  drawForeground();
}

void setSkyColor(float luminosity) {
   float skyRed = luminosity / maxLuminosity * (daySkyRed - nightSkyRed) + nightSkyRed;
   float skyGreen = luminosity / maxLuminosity * (daySkyGreen - nightSkyGreen) + nightSkyGreen;
   float skyBlue = luminosity / maxLuminosity * (daySkyBlue - nightSkyBlue) + nightSkyBlue;
   background(skyRed, skyGreen, skyBlue); 
}

void drawSun(int x, int y, float luminosity) {
     noStroke();
     blendMode(BLEND);
     for (int i=0;i<luminosity*2;i++) {
         float transparency = (10*i/luminosity);
         fill(colors.get("sunYellow"), transparency);
         circle(x,y,i*12.5);
     }
     blendMode(SCREEN);
     fill(colors.get("sunYellow"),100*luminosity/maxLuminosity);
     circle(x,y,100);
     blendMode(BLEND);
}

void drawForeground() {
  drawHill();
  drawTree(850,225,130);
  drawTree(880,220,150);
  drawTree(800,250,150);
  drawTree(960,230,150);
  drawTree(700,300,170);
}

void drawHill() {
    fill(colors.get("grassGreen"));
    stroke(colors.get("hillGreen"));
    strokeWeight(13);
    beginShape();
  
    vertex(1000, 400);
    bezierVertex(700, 200, 400, 900, 0, 900);
    
    vertex(0, height);
    vertex(1000, height);
    
    endShape(CLOSE);
}

void drawTree(int x, int y, int size) {
    ellipseMode(CENTER);
    rectMode(CENTER);
    strokeWeight(3);
    fill(colors.get("treeTrunkBrown"));
    stroke(colors.get("darkBrown"));
    rect(x,y + 100,size/6,size);
    strokeWeight(5);
    fill(colors.get("leafGreen")); 
    stroke(colors.get("hillGreen"));
    ellipse(x,y,size,size*4/3);
}
