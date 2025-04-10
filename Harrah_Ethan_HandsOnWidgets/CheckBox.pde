class Checkbox extends Button {
  boolean checked;
  int baseCheckedColor;
  int highlightCheckedColor;

  Checkbox(Runnable action, float xPos, float yPos, float size, int baseUncheckedColor, int highlightUncheckedColor, int baseCheckedColor, int highlightCheckedColor) {
    super(action, xPos, yPos, size, size, "rect", baseUncheckedColor, highlightUncheckedColor);
    this.checked = false;
    this.baseCheckedColor = baseCheckedColor;
    this.highlightCheckedColor = highlightCheckedColor;
  }

  @Override
  void render() {
    renderColor();
    super.renderShape();
    if (this.checked) {
      drawCheckMark();
    }
  }

  @Override
  void renderColor() {
    if (this.checked) {
      if (this.isMouseOverButton()) {
        fill(this.highlightCheckedColor);
      } else {
        fill(this.baseCheckedColor);
      }
    } else if (this.isMouseOverButton()) {
      fill(this.highlightColor);
    } else {
      fill(this.baseColor);
    }
  }

  @Override
  void mousePressed() {
    if (this.isMouseOverButton()) {
      this.checked = !this.checked;
    }
  }

  void drawCheckMark() {
    stroke(0);
    strokeWeight(size.x * 0.25); // Adjusted thickness based on checkbox size
    noFill();

    float offset = size.x * 0.2; // Offset for positioning inside the checkbox

    // Draw a more prominent checkmark
    line(pos.x - offset, pos.y, pos.x - size.x * 0.05, pos.y + size.y * 0.3);
    line(pos.x - size.x * 0.05, pos.y + size.y * 0.3, pos.x + offset, pos.y - size.y * 0.3);
  }
}
