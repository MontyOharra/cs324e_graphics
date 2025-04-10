class Slider {
  PVector pos;
  PVector size;
  boolean vertical;
  float buttonSize; 
  float value;
  boolean dragging;
  float dragOffset;
  int trackColor;
  int buttonColor;

  Slider(float posX, float posY, float sizeX, float sizeY, boolean vertical, float buttonSize, int trackColor, int buttonColor) {
    this.pos = new PVector(posX, posY);
    this.size = new PVector(sizeX, sizeY);
    this.vertical = vertical;
    this.buttonSize = constrain(buttonSize, 0.1, 1);
    this.value = 0;
    this.dragging = false;
    this.dragOffset = 0;
    this.trackColor = trackColor;
    this.buttonColor = buttonColor;
  }

  void render() {
    drawTrack();
    drawButton();
  }

  void drawTrack() {
    fill(this.trackColor);
    noStroke();
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
  }

  void drawButton() {
    fill(this.buttonColor);
    noStroke();
    
    if (vertical) {
      float buttonY = this.pos.y + value * (this.size.y - this.size.y * buttonSize);
      rect(this.pos.x, buttonY, this.size.x, this.size.y * buttonSize);
    } else {
      float buttonX = this.pos.x + value * (this.size.x - this.size.x * buttonSize);
      rect(buttonX, this.pos.y, this.size.x * buttonSize, this.size.y);
    }
  }

  void mousePressed() {
    if (isMouseOverButton()) {
      dragging = true;
      
      if (vertical) {
        float buttonY = this.pos.y + value * (this.size.y - this.size.y * buttonSize);
        dragOffset = mouseY - buttonY;
      } else {
        float buttonX = this.pos.x + value * (this.size.x - this.size.x * buttonSize);
        dragOffset = mouseX - buttonX;
      }
    }
  }

  void mouseReleased() {
    dragging = false;
  }

  void update() {
    if (dragging) {
      if (vertical) {
        float mouseRelative = constrain(mouseY - dragOffset, this.pos.y, this.pos.y + this.size.y - this.size.y * buttonSize);
        value = (mouseRelative - this.pos.y) / (this.size.y - this.size.y * buttonSize);
      } else {
        float mouseRelative = constrain(mouseX - dragOffset, this.pos.x, this.pos.x + this.size.x - this.size.x * buttonSize);
        value = (mouseRelative - this.pos.x) / (this.size.x - this.size.x * buttonSize);
      }
    }
  }

  boolean isMouseOverButton() {
    if (vertical) {
      float buttonY = this.pos.y + value * (this.size.y - this.size.y * buttonSize);
      return mouseX >= this.pos.x && mouseX <= this.pos.x + this.size.x && mouseY >= buttonY && mouseY <= buttonY + this.size.y * buttonSize;
    } else {
      float buttonX = this.pos.x + value * (this.size.x - this.size.x * buttonSize);
      return mouseY >= this.pos.y && mouseY <= this.pos.y + this.size.y && mouseX >= buttonX && mouseX <= buttonX + this.size.x * buttonSize;
    }
  }

  float getValue() {
    return value;
  }
}
