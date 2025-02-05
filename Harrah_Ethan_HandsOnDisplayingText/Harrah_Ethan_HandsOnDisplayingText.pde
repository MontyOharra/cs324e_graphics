PFont courierSmall;
PFont courierMedium;
PFont courierLarge;
String screenText;

void setup() {
    size(500,500);
    courierSmall = createFont("Courier", 8);
    courierMedium = createFont("Courier", 16);
    courierLarge = createFont("Courier", 32);
    screenText = "";
}

void draw() {
    background(0);
    textFont(courierSmall);
    text(screenText, 100, 100);
    textFont(courierMedium);
    text(screenText, 200, 40);
    textFont(courierLarge);
    text(screenText, 225, 300);
    textFont(courierSmall);
    text(screenText, 400, 50);
}

void keyPressed() {
  if (key == BACKSPACE) {
    screenText = screenText.substring(0, max(0, screenText.length()-1));
  } else {
    screenText = screenText + key;
  }  
}
