import java.util.ArrayList;
import java.util.Random;

class Field {
  private float fieldHeight;
  private int backgroundColor;
  private float campfireX;
  private float campfireY;
  private float grassDensity;
  private ArrayList<GrassPatch> grassPatches;
  
  Field(float fieldHeight, int backgroundColor, float campfireX, float campfireY, float grassDensity) {
    this.fieldHeight = fieldHeight;
    this.backgroundColor = backgroundColor;
    this.campfireX = campfireX;
    this.campfireY = campfireY;
    this.grassDensity = 10 / grassDensity;
    this.grassPatches = new ArrayList<>();
    createGrassPatches();
  }
  
  void createGrassPatches() {
    // Populates the list of grass patches, with the number of patches being based on the given grassDensity 
    for (int x = 0; x <= width; x+= this.grassDensity) {
      for (float y = height - this.fieldHeight; y <= height + 50; y+= this.grassDensity) {
          if ((x < this.campfireX - 60 || x > this.campfireX + 60) || (this.campfireY + 80 < y)) {
              this.grassPatches.add(new GrassPatch(x, y, 3.0, 10.0, 6, 4.0, 40.0, PI/6));
          }
        }
      }
  }
  
  void renderBase() {
    rectMode(CORNER);
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
  
