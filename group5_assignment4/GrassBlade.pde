class GrassBlade {
  private float baseX;
  private float baseY;
  private float bladeWidth;
  private float bladeHeight;
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
    // sway - a float that determines the amount of bend in the GrassBlade's appearance
    pushMatrix();                        // Save the current transformation matrix
    translate(this.baseX, this.baseY);   // Move the origin to the blade's base
    rotate(this.baseRotation + 1 / 150); // Rotate the coordinate system by 'rotation'
    
    stroke(this.bladeOutlineColor);
    fill(this.bladeFillColor);
    strokeWeight(1);
    
    // Draw the grass blade relative to (0,0) now that we've translated
    // Uses bezier curves in order to keep the base of the blade at the
    //    same spot, while creating a bending effect in the top of the blade.
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
