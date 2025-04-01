class Firework {
  Debris[] debrisList;
  PVector origin;

  Firework(float x, float y) {
    origin = new PVector(x, y);
    debrisList = new Debris[debrisCount];
    explode(); // Explode firework immediately as it is made.
  }

  void explode() {
    for (int i = 0; i < debrisCount; i++) {
      // Create debris at origin with 50% squares and 50% stars
      debrisList[i] = new Debris(origin.x, origin.y, random(1) > 0.5); 
    }
  }

  void display() {
    for (int i = 0; i < debrisCount; i++) {
      if (debrisList[i] != null) {
        // Add gravitational force to debris, update their movements and colors, and display them.
        debrisList[i].applyForce(new PVector(0, gravity));
        debrisList[i].update();
        debrisList[i].updateColor();
        debrisList[i].display();
        
        if (debrisList[i].isDone()) {
          debrisList[i] = null; // Track when debris disappears.
        }
      }
    }
  }

  boolean isDone() {
    for (int i = 0; i < debrisCount; i++) {
      if (debrisList[i] != null) {
        return false;
      }
    }
    // Return whether all debris / the firework itself has fully disappeared.
    return true;
  }
}
