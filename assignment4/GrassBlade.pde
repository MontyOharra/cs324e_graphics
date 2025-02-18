
class GrassBlade {
  private float baseX;
  private float baseY;
  private float bladeWidth;
  private float bladeHeight;
  private float bladeSway;
  private int bladeFillColor;
  private int bladeOutlineColor;
  private float baseRotation;
  
  GrassBlade(float baseX, float baseY, float bladeWidth, float bladeHeight, int bladeFillColor, int bladeOutlineColor, float baseRotation) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.baseRotation = baseRotation;
    this.bladeWidth = bladeWidth;
    this.bladeHeight = bladeHeight;
    this.bladeFillColor = bladeFillColor;
    this.bladeOutlineColor = bladeOutlineColor;

  }

  void render(float sway) {
    pushMatrix();                  // Save the current transformation matrix
    translate(this.baseX, this.baseY); // Move the origin to the blade's base
    rotate(this.baseRotation + 1 / 150);         // Rotate the coordinate system by 'rotation'
    
    stroke(this.bladeOutlineColor);
    fill(this.bladeFillColor);
    strokeWeight(1);
    
    // Draw the grass blade relative to (0,0) now that we've translated
    beginShape();
    vertex(0, 0);
    bezierVertex(
      this.bladeWidth, 0,
      this.bladeWidth, -this.bladeHeight / 2,
      sway, -this.bladeHeight
    );
    vertex(sway, -this.bladeHeight);
    bezierVertex(
      -this.bladeWidth, -this.bladeHeight / 2,
      -this.bladeWidth, 0,
      0, 0
    );
    endShape();
    popMatrix();    
  }
}
