class PauseScreen {
  GameManager manager;
  PVector windowSize;
  
  PauseScreen(GameManager manager) {
    this.manager = manager;
    this.windowSize = manager.windowSize;
  }
  
  void render() {}
  void mousePressed() {}
}
