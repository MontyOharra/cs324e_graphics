import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

class GameManager {
  PVector windowSize;
  String currentState;
  Map<String, Object> settings;
  
  StartScreen startScreen;
  SettingsScreen settingsScreen;
  GameScreen gameScreen;
  PauseScreen pauseScreen;
  DefeatScreen defeatScreen;
  
  GameManager(PVector windowSize) {
    this.windowSize = windowSize;
    this.currentState = "start";
    
    this.settings = new HashMap();
    this.settings.put("playerColor", "white");
    this.startScreen = new StartScreen(this);
    this.settingsScreen = new SettingsScreen(this);
    this.gameScreen = new GameScreen(this);
    this.pauseScreen = new PauseScreen(this);
    this.defeatScreen = new DefeatScreen(this);
  }
  
  void render() {
    background(0);
    if (this.currentState.equals("start")) {
      this.startScreen.render();
    } else if (this.currentState.equals("game")) {
      this.gameScreen.render(); 
      this.gameScreen.incrementTime();
    } else if (this.currentState.equals("paused")) {
      // Render game screen (without updates) and overlay pause screen.
      this.gameScreen.render();
      this.pauseScreen.render();
    } else if (this.currentState.equals("settings")) {
      this.settingsScreen.render();
    } else if (this.currentState.equals("defeat")) {      
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
      
    } else if (this.currentState == "paused") {
      this.pauseScreen.mousePressed();
    } else if (this.currentState == "defeat") {
      this.defeatScreen.mousePressed();
    }
  }
   
  void keyPressed() {
    if (this.currentState == "start") {
      
    } else if (this.currentState == "settings") {
      
    } else if (this.currentState == "game") {
      this.gameScreen.keyPressed();
    } else if (this.currentState == "paused") {
      this.pauseScreen.keyPressed();
      this.gameScreen.keyPressed();
    } else if (this.currentState == "defeat") {
      
    }
  }
  
  void keyReleased() {
    if (this.currentState == "game") {
      this.gameScreen.keyReleased();
    }
  }
  
  
  Integer getPlayerColor() {
     String playerColorValue = (String) this.settings.get("playerColor");
     if (playerColorValue == "white") {return color(255);}
     else if (playerColorValue == "red") {return color(255, 0, 0);}
     else if (playerColorValue == "green") {return color(0, 255, 0);}
     else if (playerColorValue == "blue") {return color(0, 0, 255);}
     else {return null;} 
  }
 
}
