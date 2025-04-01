class Wind {
  float windSpeed;          // Current wind speed (can be positive, negative, or zero)
  float targetWindSpeed;    // Target wind speed to transition to
  float maxWindSpeed;       // Maximum possible wind magnitude
  float transitionRate;     // How quickly wind transitions to target speed
  float windChangeTimer;    // Timer to track when to change wind target
  float windChangeDuration; // Duration between wind target changes
  
  Wind(float maxSpeed, float transitionRate) {
    this.maxWindSpeed = maxSpeed;
    this.transitionRate = transitionRate;
    this.windSpeed = 0;
    this.targetWindSpeed = random(-maxSpeed, maxSpeed);
    this.windChangeTimer = 0;
    this.windChangeDuration = random(3, 7); // Seconds between wind changes
  }
  
  void update() {
    // Update wind change timer
    windChangeTimer += 1/frameRate;
    
    // Change wind target periodically
    if (windChangeTimer >= windChangeDuration) {
      // Set a new target wind speed (can be positive, negative, or near zero)
      targetWindSpeed = random(-maxWindSpeed, maxWindSpeed);
      
      // Reset timer and set new duration
      windChangeTimer = 0;
      windChangeDuration = random(3, 7);
    }
    
    // Smoothly transition current wind speed toward target wind speed
    float diff = targetWindSpeed - windSpeed;
    windSpeed += diff * transitionRate;
  }
  
  // Apply wind force to a debris object
  void applyTo(Debris debris) {
    // Calculate wind force (stronger wind affects lighter particles more)
    float force = windSpeed * (1/debris.mass);
    
    // Create wind force vector and apply to debris
    PVector windForce = new PVector(force, 0);
    debris.applyForce(windForce);
  }
  
  // Apply wind force to a star object
  void applyTo(Star star) {
    // Affect star's horizontal velocity slightly
    star.vx += windSpeed * 0.02;
  }
}
