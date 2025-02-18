

class Field {
  private float fieldHeight;
  private int backgroundColor;
  private float campfirePosition;
  private float currWindSpeed;
  private float grassDensity;
  private 
  
  Field(float fieldHeight, int backgroundColor, float campfirePosition, float grassDensity) {
    this.fieldHeight = fieldHeight;
    this.backgroundColor = backgroundColor;
    this.campfirePosition = campfirePosition;
    this.grassDensity = 10 / grassDensity;
    this.currWindSpeed = 0;
  }
  
  void createGrassPatches() {
     
  }
  
  void display() {
    this.renderField();
    this.renderGrass();
  }
  
  void renderField() {
     fill(backgroundColor);
     rect(0,height-this.fieldHeight,width,height);
  }
  
  void renderGrass() {
    
    // The spacing between grass blades (adjust as needed)
    
    fill(0, 255, 0);  // green color for grass
    
    // Loop over the bounding box and draw grass blades inside the border.
    for (int x = 0; x <= width; x+= this.grassDensity) {
      for (int y = height; y >= height - this.fieldHeight; y-= this.grassDensity) {
          ellipse(x, y, 4, 4);  // draw a small green circle
        }
      }
    }
  }
  
