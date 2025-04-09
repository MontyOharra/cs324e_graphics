class ButtonText {
  boolean isPressed;
  String label;
  PVector pos;
  int baseColor;
  int highlightColor;
  Runnable action;
  int fontSize;
  
  ButtonText(Runnable action, String label, PVector pos, int fontSize, int baseColor, int highlightColor) {
    this.action = action;
    this.label = label;
    this.pos = pos;
    this.fontSize = fontSize;
    this.baseColor = baseColor;
    this.highlightColor = highlightColor;
  }
  
  void render() {
    textAlign(CENTER, CENTER);
    textSize(fontSize);
    if (isMouseOver()) {
      fill(highlightColor);
    } else {
      fill(baseColor);
    }
    text(label, pos.x, pos.y);
  }
  
  void mousePressed() {
    if (isMouseOver()) {
      action.run();
    }
  }
  
  boolean isMouseOver() {
    textSize(fontSize);
    float textWidth = textWidth(label);
    float textHeight = fontSize;
    return (mouseX >= pos.x - textWidth/2 && mouseX <= pos.x + textWidth/2 &&
            mouseY >= pos.y - textHeight/2 && mouseY <= pos.y + textHeight/2);
  }
}
