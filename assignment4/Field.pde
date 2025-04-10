import java.util.ArrayList;
import java.util.Random;

class Field {
  private float fieldHeight;
  private int backgroundColor;
  private CampFire campfire;
  private float grassDensity;
  private ArrayList<GrassPatch> grassPatches;
  
  Field(float fieldHeight, int backgroundColor, CampFire campfire, float grassDensity) {
    this.fieldHeight = fieldHeight;
    this.backgroundColor = backgroundColor;
    this.campfire = campfire;
    this.grassDensity = 10 / grassDensity;
    this.currWindSpeed = 0;
    this.grassPatches = new ArrayList<>();
    createGrassPatches();
  }
  
  void createGrassPatches() {
    // Populates the list of grass patches, with the number of patches being based on the given grassDensity 
    for (int x = 0; x <= width; x+= this.grassDensity) {
      for (float y = height - this.fieldHeight; y <= height + 50; y+= this.grassDensity) {
          this.grassPatches.add(new GrassPatch(x, y, 2, 15, 4, 40, 7));
        }
      }
  }
  
  void render(float sway) {
    this.renderField();
    this.renderGrass(sway);
  }
  
  void renderField() {
     // Sets up the background of the field
     fill(backgroundColor);
     rect(0,height-this.fieldHeight,width,height);
  }
  
  void renderGrass(float sway) {
    fill(0, 255, 0);  // green color for grass
    for (GrassPatch grassPatch: this.grassPatches) {
      grassPatch.render(sway); 
    }

    }
  }
  
