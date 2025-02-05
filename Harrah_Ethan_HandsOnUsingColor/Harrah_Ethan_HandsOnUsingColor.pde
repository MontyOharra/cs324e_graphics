import java.util.Map;

Map<String, Integer> colors = new HashMap<>();

void setup() {
    colors.put("orange", color(255,150,0));
    colors.put("blue", color(0,0,255));
    colors.put("cyan", color(0,255,255));
    colors.put("darkOrange", color(200,100,0));
    colors.put("darkBlue", color(0,0,150));
    colors.put("white", color(255));
    colors.put("black", color(0));
    
    size(1000,1000);
    background(0);
    
    stroke(colors.get("white"));
    strokeWeight(3);
    
    fill(colors.get("cyan"));
    square(100,100,300);
    
    fill(colors.get("orange"));
    square(600,100,300);
    
    fill(colors.get("darkOrange"));
    square(100,600,300);
    
    fill(colors.get("blue"));
    square(600,600,300);
    
    noStroke();
    rectMode(CENTER);
       
    blendMode(SCREEN);
    for(int i = 1;i<100;i++) {
       if (i % 2 == 0) {
       fill(colors.get("orange"), 90);
       } else {
       fill(colors.get("darkOrange"), 90);
       }
       square(750,250,500/i);
    }
    
    blendMode(ADD);
    for(int i = 1;i<100;i++) {
       if (i % 2 == 0) {
       fill(colors.get("orange"), 90);
       } else {
       fill(colors.get("blue"), 90);
       }
       square(250,750,500/i);
       
    }
    
    blendMode(REPLACE);
    for(int i = 1;i<200;i++) {
       if (i % 2 == 0) {
         fill(colors.get("orange"), 100-i*100/200);
       } else {
         fill(colors.get("darkBlue"), i*100/200);
       }
       square(250-i,250-i,500/i);
    }
    
    blendMode(DIFFERENCE);
    translate(750,750);
    for(int i = 2;i<100;i++) {
       if (i % 2 == 0) {
         fill(colors.get("darkOrange"), 100);
       } else {
         fill(colors.get("orange"), 100);
       }
       rotate((2*PI*i)/100);
       square(0,0,500/i);
    }
}
