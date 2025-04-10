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
  }
  
  void startGame() {
     this.player = new Player(
       this.windowSize.x / 2, this.windowSize.y - 20, 
       this.manager.getPlayerColor()
     );
     this.score = 0;
     this.timeElapsed = 0;
     this.playerHealth = 3;
  }
  
  void render() {
    
  }
  
  void incrementTime() {
    this.timeElapsed += 1;
    for (Asteroid asteroid : this.asteroids) {
      // asteroid.move(); 
    }
    for (Enemy enemy : this.enemies) {
      // enemy.move(); 
    }
    this.checkCollisions();
  }

  
  void checkCollisions() {
    //PVector[] bulletPositions = this.player.getBulletPositions();
    for (Asteroid asteroid : this.asteroids) {
      /*
      if 
        asteroid is within player bound
      then  
        decrement health and destroy asteroid object
      */
      
    }
    for (Enemy enemy : this.enemies) {
      /* 
      if 
        enemy is within player bound
      then
        decrementHealth;
        destroyEnemy

      if 
        enemy bullet is within player bound
      then
        decrementHealth;
      */  
    }
  }
  
  void decrementHealth() {
    this.playerHealth -= 1;
    if (this.playerHealth <= 0) {
      manager.currentState = "defeat";
    }
  }
  
  void spawnEnemy(PVector pos, PVector vel) {
    // enemies.add(new Enemy(pos, vel)); 
  }
  
  void spawnAsteroid(PVector pos, PVector vel) {
    // asteroids.add(new Asteroid(pos, vel)); 
  }
  
  void keyPressed() {
    // this.player.keyPressed();
  }
}
