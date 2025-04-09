import java.util.function.Consumer;

class StartScreen {
  PVector windowSize;
  ButtonText startButton;
  ButtonText exitButton;
  ButtonText settingsButton;
  
  int titleFontSize = 48;
  int buttonFontSize = 24;
  
  StartScreen(PVector windowSize, GameWrapper gameWrapper) {
    this.windowSize = windowSize;
    PVector startPos = new PVector(windowSize.x / 2, windowSize.y / 2);
    PVector settingsPos = new PVector(windowSize.x / 2, windowSize.y / 2 + 40);
    PVector exitPos = new PVector(windowSize.x / 2, windowSize.y / 2 + 80);
    this.startButton = new ButtonText(() -> {gameWrapper.setCurrentState("running");}, "Start", startPos, this.buttonFontSize, color(255), color(200));
    this.settingsButton = new ButtonText(() -> {gameWrapper.setCurrentState("settings");}, "Settings", settingsPos, this.buttonFontSize, color(255), color(200));
    this.exitButton = new ButtonText(() -> {exit();}, "Exit", exitPos, buttonFontSize, color(255), color(200));
  }
  
  void render() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(this.titleFontSize);
    fill(255);
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
