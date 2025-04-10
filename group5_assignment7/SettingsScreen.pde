import java.util.Map;
import java.util.HashMap;

class SettingsScreen {
  PVector windowSize;
  GameManager manager;
  
  ButtonText returnButton;
  ButtonText selectColorButton;
  Map<String, ButtonSelect> colorSelectionButtons;
  
  String selectedColor;
  int buttonFontSize = 24;
    
  SettingsScreen(GameManager manager) {
    this.manager = manager;
    this.windowSize = manager.windowSize;
    
    this.selectedColor = (String) manager.settings.get("playerColor");
    
    PVector returnButtonPos = new PVector(windowSize.x / 2, 3 * windowSize.y / 4);
    this.returnButton = new ButtonText(
      () -> {manager.currentState = "start";},
      "Return", returnButtonPos, this.buttonFontSize, 
      color(255), color(200)
    );
    
    PVector selectColorButtonPos = new PVector(windowSize.x / 2, windowSize.y / 2);
    this.selectColorButton = new ButtonText(
      () -> {manager.settings.put("playerColor", this.selectedColor);}, 
      "Select Color", selectColorButtonPos, this.buttonFontSize, 
      color(255), color(200)
     );
    
    float colorSelectionButtonsY =  windowSize.y / 3;
    float colorSelectionButtonsSize = 20;
    this.colorSelectionButtons = new HashMap();
    this.colorSelectionButtons.put("white", new ButtonSelect(
        () -> {this.selectColor("white");},
        new PVector(2 * windowSize.x / 7, colorSelectionButtonsY), colorSelectionButtonsSize,
        color(100), color(200), color(255)
      )
    );
    this.colorSelectionButtons.put("red", new ButtonSelect(
        () -> {this.selectColor("red");},
        new PVector(3 * windowSize.x / 7, colorSelectionButtonsY), colorSelectionButtonsSize,
        color(100,0,0), color(200,0,0), color(255,0,0)
      )
    );
    this.colorSelectionButtons.put("green", new ButtonSelect(
        () -> {this.selectColor("green");},
        new PVector(4 * windowSize.x / 7, colorSelectionButtonsY), colorSelectionButtonsSize,
        color(0,100,0), color(0,200,0), color(0,255,0)
      )
    );
    this.colorSelectionButtons.put("blue", new ButtonSelect(
        () -> {this.selectColor("blue");},
        new PVector(5 * windowSize.x / 7, colorSelectionButtonsY), colorSelectionButtonsSize,
        color(0,0,100), color(0,0,200), color(0,0,255)
      )
    );
    this.selectColor(this.selectedColor);
  }
  
  void render() {
    background(0);
    
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(this.manager.getPlayerColor());
    text("Current Player Color: " + this.manager.settings.get("playerColor"), this.windowSize.x / 2, this.windowSize.y / 4);
    fill(255);
    
    this.selectColorButton.render();
    this.returnButton.render();
    for (ButtonSelect currColorButton : this.colorSelectionButtons.values()) {
        currColorButton.render();
    }
  }
  
  void mousePressed() {
    this.selectColorButton.mousePressed();
    this.returnButton.mousePressed();
    for (ButtonSelect currColorButton : this.colorSelectionButtons.values()) {
        currColorButton.mousePressed();
    }
  }
  
  void selectColor(String colorToSelect) {
    for (ButtonSelect currColorButton : this.colorSelectionButtons.values()) {
        currColorButton.deselect();
    }
    this.colorSelectionButtons.get(colorToSelect).select();
    this.selectedColor = colorToSelect;
  }
}
