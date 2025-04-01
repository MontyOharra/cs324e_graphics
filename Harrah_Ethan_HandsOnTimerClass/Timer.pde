class Timer {
  int activationIntervalAmount;
  int currentTimerAmount;
  boolean isRunning;
  Runnable action;
  
  Timer(int activationIntervalAmount, Runnable action) {
    this.activationIntervalAmount = activationIntervalAmount;
    this.action = action;
    this.currentTimerAmount = 0;
    this.isRunning = true;
  }
  
  void checkTimerActivation() {
    if (isRunning == false) {
      return;
    }
    if ((millis() - this.currentTimerAmount) >= this.activationIntervalAmount) {
      this.action.run();
      this.currentTimerAmount = millis();
    }
  }
  
  void pause() {
    this.isRunning = false;
  }
  
  void play() {
    this.isRunning = true; 
  }
}
