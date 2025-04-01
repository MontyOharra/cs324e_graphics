PImage[] sprites;    // Array to hold sprite images
int numFrames = 8; // Total number of frames in the sprite sequence

void setup(){
  size(800, 600);
   
  sprites = loadSprites("tile", ".png", numFrames, 1);
  frameRate(120);
}

void draw(){
  background(255); // Clear the screen with a white background
  int index = frameCount % numFrames;
  image(sprites[index], width/2 - sprites[index].width/2, height/2 - sprites[index].height/2);
}

PImage[] loadSprites(String baseFileName, String fileType, int numFrames, int numPaddingZeroes) {
  PImage[] sprites = new PImage[numFrames];
  
  for (int i = 0; i < numFrames; i++) {
    String fullFileName = baseFileName + nf(i, numPaddingZeroes) + fileType; 
    sprites[i] = loadImage(fullFileName);
  }
  
  return sprites;
}
