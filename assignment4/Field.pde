import java.util.ArrayList;
import java.util.Random;

class Field {
  private float fieldHeight;
  private int backgroundColor;
  private float campfirePosition;
  private float currWindSpeed;
  private float grassDensity;
  private ArrayList<GrassPatch> grassPatches;
  
  Field(float fieldHeight, int backgroundColor, float campfirePosition, float grassDensity) {
    this.fieldHeight = fieldHeight;
    this.backgroundColor = backgroundColor;
    this.campfirePosition = campfirePosition;
    this.grassDensity = 10 / grassDensity;
    this.currWindSpeed = 0;
    this.grassPatches = new ArrayList<>();
    createGrassPatches();
  }
  
  void createGrassPatches() {
    Random rand = new Random();
    for (int x = 0; x <= width; x+= this.grassDensity) {
      for (float y = height - this.fieldHeight; y <= height + 50; y+= this.grassDensity) {

          this.grassPatches.add(new GrassPatch(x, y, 2, 15, 4, 40, 7));  // draw a small green circle
        }
      }
  }
  
  void render(float sway) {
    this.renderField();
    this.renderGrass(sway);
  }
  
  void renderField() {
     fill(backgroundColor);
     rect(0,height-this.fieldHeight,width,height);
  }
  
  void renderGrass(float sway) {
    
    // The spacing between grass blades (adjust as needed)
    
    fill(0, 255, 0);  // green color for grass
    for (GrassPatch grassPatch: this.grassPatches) {
      grassPatch.render(sway); 
    }
    // Loop over the bounding box and draw grass blades inside the border.

    }
  }
  
