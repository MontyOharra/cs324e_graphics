class ButtonSelect {
  Runnable action;
  boolean isPressed;
  boolean isSelected;
  
  PVector pos;
  float size;
  
  int baseColor;
  int highlightColor;
  int selectedColor;
  
  ButtonSelect(Runnable action, PVector pos, float size, int baseColor, int highlightColor, int selectedColor) {
    this.action = action;
    this.pos = pos;
    this.size = size;
    this.baseColor = baseColor;
    this.highlightColor = highlightColor;
    this.selectedColor = selectedColor;
  }
  
  void render() {
    ellipseMode(CENTER);
    if (this.isMouseOver()) {
      fill(this.highlightColor);
    } else {
      if (this.isSelected == true) {
        fill(this.selectedColor); 
      } else {
        fill(this.baseColor);
      }  
    }
    circle(this.pos.x, this.pos.y, this.size);
  }
  
  void select() {
    this.isSelected = true; 
  }
  void deselect() {
    this.isSelected = false; 
  }
  
  void mousePressed() {
    if (this.isMouseOver()) {
      this.action.run();
    }
  }
  
  boolean isMouseOver() {
    return (mouseX >= this.pos.x - this.size/2 && mouseX <= this.pos.x + this.size/2 &&
            mouseY >= this.pos.y - this.size/2 && mouseY <= this.pos.y + this.size/2);
  }
}
