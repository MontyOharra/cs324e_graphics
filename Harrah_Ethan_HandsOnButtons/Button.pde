class Button {
  boolean isPressed;
  String buttonType; // ellipse, rect, etc...
  PVector pos;
  PVector size;
  int baseColor;
  int highlightColor;
  final Runnable action;
  
  Button(Runnable action, float xPos, float yPos, float xSize, float ySize, String buttonType, int baseColor, int highlightColor) {
    this.action = action;
    this.pos = new PVector(xPos, yPos);
    this.size = new PVector(xSize, ySize);
    this.buttonType = buttonType;
    this.baseColor = baseColor;
    this.highlightColor = highlightColor;
}
 
  void render() {
     if (this.isMouseOverButton() == true) {
       fill(this.highlightColor);  
     } else {
       fill(this.baseColor);
     }
     if (buttonType == "rect") {
       rectMode(CENTER);
       rect(this.pos.x, this.pos.y, this.size.x * 2, this.size.y * 2);
     } else if (buttonType == "ellipse") {
       ellipseMode(CENTER);
       ellipse(this.pos.x, this.pos.y ,this.size.x * 2, this.size.y * 2);
     }
  }
  
  void mousePressed() {
    if (this.isMouseOverButton() == true) {
      this.action.run(); 
    }
  }
  
  boolean isMouseOverButton() {
    if (this.buttonType == "rect") {
      if (
        this.pos.x - this.size.x <= mouseX && mouseX <= this.pos.x + this.size.x &&
        this.pos.y - this.size.y <= mouseY && mouseY <= this.pos.y + this.size.y
      ) {
        return true; 
      } else {
        return false; 
      }
    } else if (this.buttonType == "ellipse") {
      if (
        (
        Math.pow(((mouseX - this.pos.x) / this.size.x),2) + 
        Math.pow(((mouseY - this.pos.y) / this.size.y),2)
        ) <= 1
      ) {
        return true; 
      } else {
        return false; 
      }
    } else {
      return false; 
    }
  }
  
}
