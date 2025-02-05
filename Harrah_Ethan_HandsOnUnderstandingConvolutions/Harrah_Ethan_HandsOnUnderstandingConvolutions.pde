PImage img;
int[][] convolution = new int[3][3];

void settings() {
    img = loadImage("rename.jpg");
    size(img.width, img.height);
}

void setup() {
    
    int[] currRow = new int[3];
    currRow[0] = 0;
    currRow[1] = -1;
    currRow[2] = 0;
    convolution[0] = currRow;
    currRow[0] = -1;
    currRow[1] = 5;
    currRow[2] = -1;
    convolution[1] = currRow;
    currRow[0] = 0;
    currRow[1] = -1;
    currRow[2] = 0;
    convolution[2] = currRow;
    
    colorMode(HSB, 360, 100, 100);
    int c = color(270, 100, 70);
    colorMode(RGB, 255, 255, 255);
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    PImage newImg = myTint(img, r, g, b);
    image(newImg, 0, 0);
}



PImage myTint(PImage img, float rTint, float gTint, float bTint) {
  PImage newImg = new PImage(img.width, img.height);
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
       int pixelNum = x + y*img.width; 
       color c = img.pixels[pixelNum];
       float newRedValue = red(c) * (rTint/255.0);
       float newGreenValue = green(c) * (gTint/255.0);
       float newBlueValue = blue(c) * (bTint/255.0);
       newImg.pixels[pixelNum] = color(newRedValue, newGreenValue, newBlueValue);
       
    }
  }
  
  newImg.updatePixels();
  return newImg;
}
