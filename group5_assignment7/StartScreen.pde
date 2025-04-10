import java.util.function.Consumer;

class StartScreen {
  PVector windowSize;
  GameManager manager;
  ButtonText startButton;
  ButtonText exitButton;
  ButtonText settingsButton;
  
  int titleFontSize = 48;
  int buttonFontSize = 24;
  
  StartScreen(GameManager manager) {
    this.windowSize = manager.windowSize;
    this.manager = manager;
    
    PVector startButtonPos = new PVector(windowSize.x / 2, windowSize.y / 2);
    this.startButton = new ButtonText(
      () -> {manager.currentState = "running";}, 
      "Start", 
      startButtonPos, this.buttonFontSize, 
      color(255), color(200)
    );
    
    PVector settingsButtonPos = new PVector(windowSize.x / 2, windowSize.y / 2 + 40);
    this.settingsButton = new ButtonText(
      () -> {manager.currentState = "settings";}, 
      "Settings", 
      settingsButtonPos, this.buttonFontSize, 
      color(255), color(200)
    );
    
    PVector exitButtonPos = new PVector(windowSize.x / 2, windowSize.y / 2 + 80);
    this.exitButton = new ButtonText(
      () -> {exit();}, 
      "Exit", 
      exitButtonPos, buttonFontSize, 
      color(255), color(200)
    );
  }
  
  void render() {
    background(0);
    textAlign(CENTER, CENTER);
    fill(255);
    
    textSize(this.titleFontSize);
    text("Game Name", this.windowSize.x / 2, this.windowSize.y / 4);
   
    this.startButton.render();
    this.exitButton.render();
    this.settingsButton.render();
  }
  
  void mousePressed() {
    this.startButton.mousePressed();
    this.settingsButton.mousePressed();
    this.exitButton.mousePressed(); 
  }
}
