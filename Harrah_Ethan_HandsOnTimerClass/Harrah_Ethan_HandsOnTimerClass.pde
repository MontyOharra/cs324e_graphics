int animationTimer = 0;
int animationTimerValue = 50;
int currentFrame = 0;
int numFrames = 8;
PImage[] sprites;
Timer timer;


void setup() {
  size(500,500);
  
  sprites = loadSprites("tile", ".png", numFrames, 1);
  timer = new Timer(10, () -> setCurrentFrame());
  frameRate(120);
;}

void draw() {
  image(sprites[currentFrame], 20, 250);
  timer.checkTimerActivation();
}

void mousePressed() {
  if (timer.isRunning) {
    timer.pause(); 
  } else {
    timer.play();
  }
}

void setCurrentFrame() {
  currentFrame = (currentFrame + 1) % numFrames; 
}

PImage[] loadSprites(String baseFileName, String fileType, int numFrames, int numPaddingZeroes) {
  PImage[] sprites = new PImage[numFrames];
  
  for (int i = 0; i < numFrames; i++) {
    String fullFileName = baseFileName + nf(i, numPaddingZeroes) + fileType; 
    sprites[i] = loadImage(fullFileName);
  }
  
  return sprites;
}
