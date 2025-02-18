import java.util.Random;

class GrassPatch {  
  private GrassBlade[] blades;
  
  GrassPatch(float baseX, float baseY, float baseWidth, float baseHeight, float widthMaxVariance, float heightMaxVariance, int bladeCount) {
    
    Random rand = new Random();
    
    blades = new GrassBlade[bladeCount];  
    for (int i = 0; i < bladeCount; i++) {
      float bladeWidth = baseWidth + widthMaxVariance * rand.nextFloat() * 2 - 1;
      float bladeHeight = baseHeight + heightMaxVariance * rand.nextFloat() * 2 - 1;
      float bladeRotation = rand.nextFloat() * PI/3 - PI/6;
      float greenFillValue = rand.nextFloat() * 100 + 120;
      float redFillValue = rand.nextFloat() * greenFillValue * .5;
      float redBorderValue = redFillValue * .7;
      float greenBorderValue = greenFillValue * .7;
      blades[i] = new GrassBlade(baseX, baseY, bladeWidth, bladeHeight, color(redFillValue,greenFillValue,0), color(redBorderValue,greenBorderValue,0), bladeRotation); 
    }
  }
  
  void render(float sway) {
     for (int i = 0; i < this.blades.length; i++) {
       blades[i].render(sway); 
     }
  }
}
