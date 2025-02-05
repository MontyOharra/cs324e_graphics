PImage img;

void settings() {
    img = loadImage("rename.jpg");
    size(img.width, img.height);
}

void setup() {
    PImage newImg = myTint(img, 0, 255, 255);
    image(newImg, 0, 0);
}



PImage myTint(PImage img, int rTint, int gTint, int bTint) {
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
