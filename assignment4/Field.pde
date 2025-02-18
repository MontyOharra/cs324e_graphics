Field field;


void setup() {
  size(800,800);
  PShape fieldShape = createShape();
  fieldShape.beginShape();
    fieldShape.curveVertex(100,100);
    fieldShape.curveVertex(200,300);
    fieldShape.curveVertex(500,50);
    fieldShape.curveVertex(100,200);
    fieldShape.bezierVertex(200,200,300,100,400,500);
    fieldShape.curveVertex(100,200);
  fieldShape.endShape();
  field = new Field(fieldShape, color(0,255,0), 1, 1);
  
}

void draw() {
  field.display();
  PShape fieldShape2 = createShape();
  fieldShape2.beginShape();
    fieldShape2.curveVertex(100,100);
    fieldShape2.curveVertex(200,300);
    fieldShape2.curveVertex(500,50);
    fieldShape2.curveVertex(100,200);
    fieldShape2.bezierVertex(200,200,300,100,400,500);
    fieldShape2.curveVertex(100,200);
  fieldShape2.endShape();
  shape(fieldShape2,0,0);
}

class Field {
  private PShape border;
  private int backgroundColor;
  private float campfirePosition;
  private float currWindSpeed;
  private float grassDensity;
  
  Field(PShape border, int backgroundColor, float campfirePosition, float grassDensity) {
    this.border = border;
    this.backgroundColor = backgroundColor;
    this.campfirePosition = campfirePosition;
    this.grassDensity = grassDensity;
    this.currWindSpeed = 0;
  }
  
  void display() {
    this.renderField();
    this.renderGrass();
  }
  
  void renderField() {
     fill(backgroundColor);
     shape(this.border, 0, 0);
  }
  
  void renderGrass() {
    // Calculate the bounding box of the border shape (assumes a simple polygon)
    float minX = Float.MAX_VALUE, minY = Float.MAX_VALUE;
    float maxX = -Float.MAX_VALUE, maxY = -Float.MAX_VALUE;
    int count = border.getVertexCount();
    for (int i = 0; i < count; i++) {
      PVector v = border.getVertex(i);
      if (v.x < minX) minX = v.x;
      if (v.y < minY) minY = v.y;
      if (v.x > maxX) maxX = v.x;
      if (v.y > maxY) maxY = v.y;
    }
    
    // The spacing between grass blades (adjust as needed)
    float spacing = 10.0 / grassDensity;
    
    fill(0, 255, 0);  // green color for grass
    
    // Loop over the bounding box and draw grass blades inside the border.
    for (float x = minX; x <= maxX; x += spacing) {
      for (float y = minY; y <= maxY; y += spacing) {
        if (pointInside(border, x, y)) {
          ellipse(x, y, 4, 4);  // draw a small green circle
        }
      }
    }
  }
  
}

// Returns true if (x,y) is inside the polygon defined by the PShape s
boolean pointInside(PShape s, float x, float y) {
  int n = s.getVertexCount();
  boolean inside = false;
  for (int i = 0, j = n - 1; i < n; j = i++) {
    PVector vi = s.getVertex(i);
    PVector vj = s.getVertex(j);
    if (((vi.y > y) != (vj.y > y)) &&
        (x < (vj.x - vi.x) * (y - vi.y) / (vj.y - vi.y) + vi.x)) {
      inside = !inside;
    }
  }
  return inside;
}
