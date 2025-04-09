class GameScreen {
  PVector windowSize;
  Player player;
  // ArrayList<Asteroid> asteroids;
  // ArrayList<Enemy> enemies;
  
  Float timeElapsed;
  Integer score;
  
  GameScreen(PVector windowSize) {
    this.windowSize = windowSize;
   
    this.player = null;
    //this.asteroids = new ArrayList;
    //this.enemies = new ArrayList();
    this.score = null;
    this.timeElapsed = null;
  }
  
  void render() {}
  void incrementTime() {}
  void mousePressed() {}
}
