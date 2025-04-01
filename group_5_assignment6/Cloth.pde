import java.util.Map;
import java.util.Random;

class Cloth {
  ArrayList<PVector> vertices;          // The bounds of the Cloth object
  int xLowerBound, xUpperBound, yLowerBound, yUpperBound;
  ArrayList<ClothThread> threads;       // The array of all ClothThread objects
  ArrayList<ClothThread> threadsOnFire; // The array for keeping track of which threads are on fire
  
  // Variables to be passed down into each of the ClothThread objects.
  int threadSize;
  float heatTransferRate;
  float timeToBurn;
  float timeToAsh;
  Random rand = new Random();
  
  Cloth(ArrayList<PVector> vertices, int threadSize, float heatTransferRate, float timeToBurn, float timeToAsh) {
    this.vertices = vertices;
    this.threadSize = threadSize;
    this.threadsOnFire = new ArrayList();
    this.heatTransferRate = heatTransferRate;
    this.timeToBurn = timeToBurn * rand.nextFloat() * 2;
    this.timeToAsh = timeToAsh * rand.nextFloat() * 2;
    this.threads = this.createThreadArray(vertices);
  }
  
  ArrayList<ClothThread> createThreadArray(ArrayList<PVector> vertices) {
     /*
        Generates the array of ClothThread objects to be stored and used
        within the Cloth class' methods
        
        Takes in a list of vertices to use as the bounds for the cloth
     */
     int xLowerBound = width, xUpperBound = 0;
     int yLowerBound = height, yUpperBound = 0;
     // Iterates over the vertices and creates upper and lower bounds
     // for where to instantiate the various ClothThread objects
     for (PVector vertex : vertices) {
        int vertexX = int(vertex.x), vertexY = int(vertex.y);
        if (vertexX < xLowerBound) {xLowerBound = vertexX;}
        if (vertexX > xUpperBound) {xUpperBound = vertexX;}
        if (vertexY < yLowerBound) {yLowerBound = vertexY;}
        if (vertexY > yUpperBound) {yUpperBound = vertexY;}
     }
     
     this.xLowerBound = xLowerBound;
     this.xUpperBound = xUpperBound;
     this.yLowerBound = yLowerBound;
     this.yUpperBound = yUpperBound;
     
     // Loops through the x and y between lower and upper bounds
     // and creates a new ClothThread object with the properties
     // passed to the Cloth object
     ArrayList<ClothThread> threads = new ArrayList();
     for (int x = xLowerBound; x < xUpperBound; x += this.threadSize) {
       for (int y = yLowerBound; y < yUpperBound; y += this.threadSize) {
          ClothThread currThread = new ClothThread(x, y, this.threadSize, this.timeToBurn, this.timeToAsh);
          threads.add(currThread);
       }
     }
     
     return threads;
  }
  
  void render() {
    // Loop through the array of ClothThreads and render each according
    // to their own methods
    for (ClothThread thread: this.threads) {
       thread.render();
    }
  }
  
  void setFire(float xPos, float yPos) {
     // Sets a thread on fire according to which is the
     // closest to the x and y positions
     ClothThread targetThread = getClosestThread(xPos, yPos);
     if (targetThread != null) {
       targetThread.setFire();
       this.threadsOnFire.add(targetThread);
     }
  }
  
  ClothThread getClosestThread(float xPos, float yPos) {
    // Loop through the array of threads. If the point passed in
    // exists within the bounds of a thread, then return that thread
    for (ClothThread thread: this.threads) {
       if (
           (thread.pos.x - thread.threadSize / 2 <= xPos && xPos <= thread.pos.x + thread.threadSize / 2) &&
           (thread.pos.y - thread.threadSize / 2 <= yPos && yPos <= thread.pos.y + thread.threadSize / 2)
       ) {
         return thread;
       }
    }
    return null;
  }
  
  boolean isPointOnCloth(float xPos, float yPos) {
    if (this.xLowerBound <= xPos && xPos <= this.xUpperBound && this.yLowerBound <= yPos && yPos <= this.yUpperBound) {
      return true;
    } else {
      return false;
    }
  }
  
  void calculateNextStep() {
     /*
       This method is called on every frame in order to calculate the next
       states of each of the threads
     */
     ArrayList<ClothThread> threadsToRemove = new ArrayList();
     for (ClothThread thread: this.threads) {
       // If the thread is not on fire, increment its heat value.
       // Heat value is incremented per thread on fire, based on the
       // proximity between the target thread and the thread on fire.
       if (thread.currentState == "noFire") {
         for (ClothThread threadOnFire: this.threadsOnFire) {
            float currDistanceToFire = sqrt(pow((thread.pos.x - threadOnFire.pos.x), 2) + pow((thread.pos.y - threadOnFire.pos.y), 2));
            thread.increaseHeat(this.heatTransferRate / currDistanceToFire / currDistanceToFire );
         }
         
         // If the heat value reaches full capacity, set the thread on fire
         if (thread.heatValue == 1) {
           thread.setFire();
           this.threadsOnFire.add(thread);
         }         
       }
       // If the thread is on fire, call the burn method on it.
       // Once the thread is fully burned, remove it from the array
       // of threads on fire
       else if (thread.currentState == "onFire") {
         boolean isBurned = thread.burn();
         if (isBurned == true) {
           this.threadsOnFire.remove(thread); 
         }
       }
       // If the thread has been burned, call the ash method.
       else if (thread.currentState == "burned") {
         boolean isAshed = thread.ash();
         if (isAshed == true) {
           threadsToRemove.add(thread); 
         }
       }
     }
     for (ClothThread thread : threadsToRemove) {
       this.threads.remove(thread); 
     }
  }
}
