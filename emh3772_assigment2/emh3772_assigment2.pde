import java.util.Map;
import java.util.HashMap;

// I wanted to make it so that different edge calculations could be passed into the main method
// In order to do that, each is of the input type (int, int, int, int) and output of int[]
// I looked it up and saw that there doesn't exist a built in type that has four int inputs
// So this interface is something I asked ChatGPT to help me generate, in order to be able to
// pass in functions as input
@FunctionalInterface
public interface CoordFindingFunction<R> {
  R apply(int a, int b, int c, int d);
}
public class Coord {
  private int x;
  private int y;

  public Coord(int x, int y) {
      this.x = x;
      this.y = y;
  }

  // Getters
  public int getX() {
      return x;
  }
  public int getY() {
      return y;
  }
    
  // Setters
  public void setX(int x) {
     this.x = x;
  }
  public void setY(int y) {
     this.y = y;
  }
}

Map<String, float[][]> kernels = new HashMap<>();
Map<String, CoordFindingFunction<Coord>> edgeFunctions = new HashMap<>();
PImage img;

String filterMode;

float currentContrastThreshold;
float currentContrastValue;

float[][] currentConv;
CoordFindingFunction<Coord> currentEdgeFunction;


void settings() {
  img = loadImage("flower.jpg");
  size(img.width, img.height);
}

void setup() {
  filterMode = "none";
  
  currentContrastThreshold = 0;
  currentContrastValue = 0;
  
  kernels.put("sharpen", new float[][] {
    { 0, -1, 0 },
    { -1, 5, -1 },
    { 0, -1, 0 }
  });
  kernels.put("gaussian-blur", new float[][] {
    { 0.0625, 0.125, 0.0625 },
    { 0.125,  0.25,  0.125  },
    { 0.0625, 0.125, 0.0625 }
  });
  kernels.put("black", new float[][] {
    { 0, 0, 0 },
    { 0, 0, 0 },
    { 0, 0, 0 }
  });
  kernels.put("sobel-horizontal", new float[][] {
    { 1, 2, 1 },
    { 0, 0, 0 },
    { -1, 2, -1 }
  });
  kernels.put("sobel-vertical", new float[][] {
    { 1, 0, -1 },
    { 2, 0, -2 },
    { 1, 0, -1 }
  });
  
  edgeFunctions.put("no-edge", getCoordsNoEdge);
  edgeFunctions.put("reflect-edge", getCoordsReflectEdge);
 
  currentConv = kernels.get("sharpen");
  currentEdgeFunction = edgeFunctions.get("reflect-edge");
}

void draw() {
  PImage newImg;
  if (filterMode == "grayscale") {
    newImg = applyGrayscale(img);
  } else if (filterMode == "contrast") {
    newImg = applyContrast(img, currentContrastThreshold, currentContrastValue); 
  } else if (filterMode == "convolution") {
    newImg = applyConvolution(img, currentConv, currentEdgeFunction);
  } else if (filterMode == "edge-detection") {
    newImg = applyEdgeDetection(img); 
  } else {
    newImg = img;
  }
  
  image(newImg, 0, 0);
}

void keyPressed() {
  if (key == '1') {
    filterMode = "grayscale";
  } else if (key == '2') {
    filterMode = "contrast"; 
    currentContrastThreshold = 125;
    currentContrastValue = 10;
  } else if (key == '3') {
    filterMode = "convolution"; 
    currentConv = kernels.get("gaussian-blur");
    currentEdgeFunction = edgeFunctions.get("reflect-edge");
  } else if (key == '4') {
    filterMode = "edge-detection"; 
  } else if (key == '0') {
    filterMode = "no-filter"; 
  }
  if (filterMode == "contrast") {
    if (key == 'q') {
      currentContrastThreshold = 10;
    } else if (key == 'w') {
      currentContrastThreshold = 15;
    } else if (key == 'a') {
      currentContrastValue = 10;
    } else if (key =='s') {
      currentContrastValue = 15;
    }
   }

  if (filterMode == "convolution") {
    if (key == 'q') {
      currentConv = kernels.get("gaussian-blur");
    } else if (key == 'w') {
      currentConv = kernels.get("sharpen");
    }
  }
  else if (key == 'a') {
    currentEdgeFunction = edgeFunctions.get("no-edge");
  } else if (key =='s') {
    currentEdgeFunction = edgeFunctions.get("reflect-edge");
  }
}

PImage applyGrayscale(PImage img) {
  PImage newImg = new PImage(img.width, img.height);
  img.loadPixels();
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int pixelIndex = x + img.width*y;
      int currColor = img.pixels[pixelIndex];
      float currRed = red(currColor);
      float currGreen = green(currColor);
      float currBlue = blue(currColor);
      
      float colorAvg = (currRed + currBlue + currGreen) / 3;
      int newColor = color(colorAvg,colorAvg,colorAvg);
      newImg.pixels[pixelIndex] = newColor;
    }
  } 
  newImg.updatePixels();
  return newImg; 
}

PImage applyContrast(PImage img, float threshold, float contrast) {
  PImage newImg = new PImage(img.width, img.height);
  img.loadPixels();
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int pixelIndex = x + img.width*y;
      int currColor = img.pixels[pixelIndex];
      float currRed = red(currColor);
      float currGreen = green(currColor);
      float currBlue = blue(currColor);
      float newRed = 0;
      float newGreen = 0;
      float newBlue = 0;
      if (currRed > threshold) {
        newRed = constrain(currRed + contrast, 0, 255);
      } else {
        newRed = constrain(currRed - contrast, 0, 255);
      }
      if (currGreen > threshold) {
        newGreen = constrain(currGreen + contrast, 0, 255);
      } else {
        newGreen = constrain(currGreen - contrast, 0, 255);
      }      
      if (currBlue > threshold) {
        newBlue = constrain(currBlue + contrast, 0, 255);
      } else {
        newBlue = constrain(currBlue - contrast, 0, 255);
      }
      int newColor = color(newRed, newGreen, newBlue);
      newImg.pixels[pixelIndex] = newColor;
    }
  } 
  newImg.updatePixels();
  return newImg; 
}

PImage applyConvolution(PImage img, float[][] kernel, CoordFindingFunction<Coord> coordFunction) {
  PImage newImg = new PImage(img.width, img.height);
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      Coord[][] convWindowCoords = getConvWindowCoords(img.width, img.height, x, y, kernel[0].length, kernel.length, coordFunction);
      int pixelIndex = x + img.width*y;
      if (convWindowCoords == null) {
        newImg.pixels[pixelIndex] = img.pixels[pixelIndex];
      } else {
        float newRed = 0;
        float newGreen = 0;
        float newBlue = 0;
        for (int convWindowX = 0; convWindowX < convWindowCoords[0].length; convWindowX++) {
          for (int convWindowY = 0; convWindowY < convWindowCoords.length; convWindowY++) {
            Coord convWindowCoord = convWindowCoords[convWindowY][convWindowX];
            int convWindowPixelIndex = convWindowCoord.getX() + img.width*convWindowCoord.getY();
            int currPixelColor = img.pixels[convWindowPixelIndex];
            float convolutionWeight = kernel[convWindowY][convWindowX];
            
            newRed += red(currPixelColor) * convolutionWeight;
            newGreen += green(currPixelColor) * convolutionWeight;
            newBlue += blue(currPixelColor) * convolutionWeight;
          }
        }
        newRed = constrain(abs(newRed), 0, 255);
        newGreen = constrain(abs(newGreen), 0, 255);
        newBlue = constrain(abs(newBlue), 0, 255);
        newImg.pixels[pixelIndex] = color(newRed, newGreen, newBlue);
      }
    }
  }
 
  newImg.updatePixels();
  return newImg;
}


Coord[][] getConvWindowCoords(int imgSizeX, int imgSizeY, int pixelX, int pixelY, int convXSize, int convYSize, CoordFindingFunction<Coord> coordFunction) {
  // coordFunction is a function that will take the image size
  // and current pixel location and return a corrected version.
  // If the coord of the pixel does not have a new coordinate
  // mapping, it returns -1 in either the x or the y.
  // In this event, getConvWindowCoords returns false to indicate
  // that this specific pixel should not have a colvolution applied.
  Coord[][] convWindowCoords = new Coord[convYSize][convXSize];
  for (int windowX = -floor(convXSize/2); windowX <= floor(convXSize/2); windowX++) {
     for (int windowY = -floor(convYSize/2); windowY <= floor(convYSize/2); windowY++) {
         Coord coord = coordFunction.apply(imgSizeX, imgSizeY, pixelX + windowX, pixelY + windowY);
         if (coord.getX() == -1 || coord.getY() == -1) {
            return null;
         }
         convWindowCoords[windowY + floor(convYSize/2)][windowX + floor(convXSize/2)] = coord;
     }
  }
  return convWindowCoords;
}

CoordFindingFunction<Coord> getCoordsReflectEdge = (int imgSizeX, int imgSizeY, int pixelX, int pixelY) -> {
  // [x, y]
  if (pixelX < 0) {
    pixelX = abs(pixelX);
  }
  else if (pixelX >= imgSizeX) {
    pixelX = 2*(imgSizeX - 1) - pixelX;
  }

  if (pixelY < 0) {
    pixelY = abs(pixelY);
  }
  else if (pixelY >= imgSizeY) {
    pixelY = 2*(imgSizeY - 1) - pixelY;
  }

  return new Coord(pixelX, pixelY);
};

CoordFindingFunction<Coord> getCoordsNoEdge = (int imgSizeX, int imgSizeY, int pixelX, int pixelY) -> {
  // [x, y]
  if (pixelX < 0) {
    pixelX = -1;
  }
  else if (pixelX >= imgSizeX) {
    pixelX = -1;
  }

  if (pixelY < 0) {
    pixelY = -1;
  }
  else if (pixelY >= imgSizeY) {
    pixelY = -1;
  }

  return new Coord(pixelX, pixelY);
};

// Unfinished
PImage applyEdgeDetection(PImage img) {
  return applyConvolution(img, kernels.get("sobel-horizontal"), currentEdgeFunction);
}
