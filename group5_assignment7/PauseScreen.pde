class PauseScreen {
  PVector windowSize;
  GameManager manager;
  ButtonText resumeButton;
  
  int titleFontSize = 48;
  int buttonFontSize = 24;
  
  PauseScreen(GameManager manager) {
    this.windowSize = manager.windowSize;
    this.manager = manager;
    
    // Set the Resume button action to switch the state back to game.
    PVector resumeButtonPos = new PVector(windowSize.x / 2, windowSize.y / 2 + 40);
    this.resumeButton = new ButtonText(
      () -> { manager.currentState = "game"; }, 
      "Resume", 
      resumeButtonPos, this.buttonFontSize, 
      color(255), color(200)
    );
  }
  
  void render() {
    pushStyle(); // Save the current style state
    noStroke();
    
    // Draw a translucent black overlay – note: we use rect() rather than background()
    fill(0, 150);  // RGB 0, alpha 150 for translucency
    rect(0, 0, windowSize.x, windowSize.y);
    
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(this.titleFontSize);
    text("Paused", windowSize.x / 2, windowSize.y / 4);
    
    this.resumeButton.render();
    popStyle(); // Restore the style state
  }
  
  void mousePressed() {
    this.resumeButton.mousePressed();
  }
  
  void keyPressed() {

  }
}
