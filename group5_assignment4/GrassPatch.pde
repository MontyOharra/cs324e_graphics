import java.util.Random;

class GrassPatch {  
  private GrassBlade[] blades;
  
  GrassPatch(float baseX, float baseY, float baseWidth, float baseHeight, int bladeCount, float widthMaxVariance, float heightMaxVariance, float rotationMaxVariance) {
    // The grass patch is made up of an array of grass blades.
    //   Each grass blade keeps the same base as the whole patch
    //   with variance among each blade's rotation, color,
    //   width, and height. These values are calculated randomly
    //   and bounded by the maxVariance variables
    Random rand = new Random();
    
    blades = new GrassBlade[bladeCount];  
    for (int i = 0; i < bladeCount; i++) {
      float bladeWidth = baseWidth + widthMaxVariance * rand.nextFloat() * 2 - 1;
      float bladeHeight = baseHeight + heightMaxVariance * rand.nextFloat() * 2 - 1;
      float bladeRotation = rotationMaxVariance * rand.nextFloat() * 2 - rotationMaxVariance / 2;
      float greenFillValue = rand.nextFloat() * 100 + 120;
      float redFillValue = rand.nextFloat() * greenFillValue * .5;
      float redBorderValue = redFillValue * .7;
      float greenBorderValue = greenFillValue * .7;
      blades[i] = new GrassBlade(baseX, baseY, bladeWidth, bladeHeight, color(redFillValue,greenFillValue,0), color(redBorderValue,greenBorderValue,0), bladeRotation); 
    }
  }
  
  void render(float sway) {
     // Loop through each blade and render it based on the inputted sway
     for (int i = 0; i < this.blades.length; i++) {
       blades[i].render(sway); 
     }
  }
}
