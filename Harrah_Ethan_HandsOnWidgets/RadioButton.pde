class RadioButton extends Button {
  boolean selected;
  RadioGroup group;
  int baseSelectedColor;
  int highlightSelectedColor;

  RadioButton(RadioGroup group, Runnable action, float xPos, float yPos, float size, int baseColor, int highlightColor, int baseSelectedColor, int highlightSelectedColor) {
    super(action, xPos, yPos, size, size, "ellipse", baseColor, highlightColor);
    this.selected = false;
    this.group = group;
    this.baseSelectedColor = baseSelectedColor;
    this.highlightSelectedColor = highlightSelectedColor;
    group.addButton(this);
  }

  @Override
  void render() {
    renderColor();
    super.renderShape();
  }

  @Override
  void renderColor() {
    if (this.selected) {
      if (this.isMouseOverButton()) {
        fill(this.highlightSelectedColor);
      } else {
        fill(this.baseSelectedColor);
      }
    } else {
      if (this.isMouseOverButton()) {
        fill(this.highlightColor);
      } else {
        fill(this.baseColor);
      }
    }
  }

  @Override
  void mousePressed() {
    if (this.isMouseOverButton()) {
      group.selectButton(this);
    }
  }

  void select() {
    this.selected = true; 
  }
  
  void unselect() {
    this.selected = false; 
  }
}

class RadioGroup {
  ArrayList<RadioButton> buttons;

  RadioGroup() {
    buttons = new ArrayList<>();
  }

  void addButton(RadioButton button) {
    buttons.add(button);
  }

  void selectButton(RadioButton selectedButton) {
    for (RadioButton button : buttons) {
      if (button == selectedButton) {
        button.select();
      } else {
        button.unselect(); 
      }
    }
  }
}
