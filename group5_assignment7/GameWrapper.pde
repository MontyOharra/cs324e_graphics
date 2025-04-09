import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

interface StateChanger {
  void changeState(String newState);
}

class GameWrapper {
  PVector windowSize;
  String currentState;
  Map<String, Object> settings;
  
  StartScreen startScreen;
  SettingsScreen settingsScreen;
  GameScreen gameScreen;
  PauseScreen pauseScreen;
  DefeatScreen defeatScreen;
  
  GameWrapper(PVector windowSize) {
    this.windowSize = windowSize;
    this.currentState = "start";
    
    this.settings = new HashMap();
    this.settings.put("playerColor", "white");
    this.startScreen = new StartScreen(windowSize, this);
    this.settingsScreen = new SettingsScreen(windowSize, this);
    this.gameScreen = new GameScreen(windowSize);
    this.pauseScreen = new PauseScreen(windowSize);
    this.defeatScreen = new DefeatScreen(windowSize);
  }
  
  void render() {
    background(0);
    if(this.currentState == "start") {
      this.startScreen.render();
    } else if (this.currentState == "game") {
      this.gameScreen.render(); 
      this.gameScreen.incrementTime();
    } else if (this.currentState == "paused") {
      this.gameScreen.render();
      tint(255, 220);
      this.pauseScreen.render();
    } else if (this.currentState == "settings") {
      this.settingsScreen.render();
    } else if (this.currentState == "defeat") {
      this.gameScreen.render();
      tint(255, 225);
      this.defeatScreen.render(); 
    }
  }
  
  void mousePressed() {
    if(this.currentState == "start") {
      this.startScreen.mousePressed();
    } else if (this.currentState == "settings") {
      this.settingsScreen.mousePressed();
    } else if (this.currentState == "game") {
      this.gameScreen.mousePressed();
    } else if (this.currentState == "paused") {
      this.pauseScreen.mousePressed();
    } else if (this.currentState == "defeat") {
      this.defeatScreen.mousePressed();
    }
  }
 
   void setCurrentState(String currentState) {
     this.currentState = currentState; 
   }
   
   void setSettingsValue(String setting, Object newValue) {
     this.settings.put(setting, newValue);
   }
 
}
