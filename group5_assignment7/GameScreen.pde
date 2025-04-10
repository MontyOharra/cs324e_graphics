class GameScreen {
  GameManager manager;
  PVector windowSize;
  Player player;
  ArrayList<Asteroid> asteroids;
  ArrayList<Enemy> enemies;
  Integer timeElapsed;
  Integer score;
  Integer playerHealth;
  
  GameScreen(GameManager manager) {
    this.manager = manager;
    this.windowSize = manager.windowSize;
    this.player = null;
    this.asteroids = new ArrayList();
    this.enemies = new ArrayList();
    this.score = null;
    this.timeElapsed = null;
    this.playerHealth = null;
    startGame();
  }
  
  void startGame() {
    this.player = new Player(this.windowSize.x / 2, this.windowSize.y - 20, this.manager.getPlayerColor(), 5);
    this.score = 0;
    this.timeElapsed = 0;
    this.playerHealth = 3;
  }
  
  void render() {
    boolean movementEnabled = this.manager.currentState.equals("game");
    this.player.update(movementEnabled);
    this.player.displayPlayer();
  }
  
  void incrementTime() {
    this.timeElapsed += 1;
    for (Asteroid asteroid : this.asteroids) {
    }
    for (Enemy enemy : this.enemies) {
    }
    this.checkCollisions();
  }
  
  void checkCollisions() {
    for (Asteroid asteroid : this.asteroids) {
    }
    for (Enemy enemy : this.enemies) {
    }
  }
  
  void decrementHealth() {
    this.playerHealth -= 1;
    if (this.playerHealth <= 0) {
      manager.currentState = "defeat";
    }
  }
  
  void spawnEnemy(PVector pos, PVector vel) {
  }
  
  void spawnAsteroid(PVector pos, PVector vel) {
  }
  
  void keyPressed() {
    if (key == 'w') wDown = true;
    if (key == 'a') aDown = true;
    if (key == 's') sDown = true;
    if (key == 'd') dDown = true;
    if (key == ' ') spaceDown = true;
    if (key == 'p') {
    if (this.manager.currentState == "paused") {
      this.manager.currentState = "game";
    } else if (this.manager.currentState == "game") {
      this.manager.currentState = "paused";
    }
      wDown = false;
      aDown = false;
      sDown = false;
      dDown = false;
      spaceDown = false;
    }
  }
  void keyReleased() {
    if (key == 'w') wDown = false;
    if (key == 'a') aDown = false;
    if (key == 's') sDown = false;
    if (key == 'd') dDown = false;
    if (key == ' ') spaceDown = false;
  }
}
