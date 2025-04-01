class ClothThread {
  PVector pos;     // Position of the thread
  float heatValue; // Current amount of heat stored in the thread
  int threadSize;  // Size of the square representing the thread
  
  float timeOnFire; // Current time that the thread has been on fire
  float timeToBurn; // Current time that the thread has been burned for
  float timeBurned; // The time it takes to fully burn a thread
  float timeToAsh;  // The time it takes to fully ash a thread
  
  // noFire, onFire, burned, ashed
  String currentState; // Used in various methods to determine the next step
  
  
  ClothThread(int xPos, int yPos, int threadSize, float timeToBurn, float timeToAsh) {
     this.pos = new PVector(xPos, yPos);
     this.threadSize = threadSize;
     this.timeToBurn = timeToBurn;
     this.timeToAsh = timeToAsh;
     
     this.heatValue = 0;
     this.timeBurned = 0;
     this.timeOnFire = 0;
     
     this.currentState = "noFire";
  }
  
  int getThreadColor() {
    if (this.currentState == "noFire") {
      // Calculates the color of the thread if not on fire according to heat value.
      // No heat is white, full heat is bright orange
      return color(
        255,
        lerp(255,100,this.heatValue),
        lerp(255,0,this.heatValue)
      );
    // On fire is red
    } else if (this.currentState == "onFire") {
      return color(255,0,0); 
    // Color goes from gray to black depending on amount of time burned
    } else if (this.currentState == "burned") {
      return color (
        lerp(100,0,timeBurned)
      );
    // Black once fully ashed
    } else if (this.currentState == "ashed") {
      return color(0); 
    } else {
      return color(255); 
    }
  }
  
  void render() {
    fill(this.getThreadColor());
    square(this.pos.x, this.pos.y, this.threadSize); 
  }
  
  boolean burn() {
    // This method returns a boolean so that the Cloth object can get
    // whether or not the ClothThread has been fully burned
    
    // Do nothing if the thread isnt on fire
    if (this.currentState != "onFire") {
      return false; 
    }
    // Increment the amount of time on fire, if it has surpassed the burn time,
    // change state to burned
    this.timeOnFire += .01;
    if (this.timeOnFire > this.timeToBurn) {
       this.currentState = "burned";
       return true;
    }
    return false;
  }
  
  void ash() {
    if (this.currentState != "burned") {
      return; 
    }
    this.timeBurned += .01;
    if (this.timeBurned > this.timeToAsh) {
      this.currentState = "ashed";
    }
  }
  
  void setFire() {
    if (this.currentState == "ashed") {
      return;
    }
    this.currentState = "onFire";
  }
  
  void setHeat(float heatValue) {
    this.heatValue = heatValue; 
  }
  
  void increaseHeat(float heatIncrease) {
    if (this.heatValue < 1) {
      this.heatValue += heatIncrease; 
      if (this.heatValue > 1) {
        this.heatValue = 1;
      }
    }
  }
}
