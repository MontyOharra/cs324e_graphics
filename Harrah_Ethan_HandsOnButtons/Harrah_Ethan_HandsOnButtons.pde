Button button1;
Button button2;
int backgroundColor;

void setup() {
  size(700, 700); 
  backgroundColor = color(255,0,0);
  button1 = new Button(
    () -> changeBackground1(), 
    100, 100,
    100, 100,
    "rect",
    color(255),
    color(200)
  );
  button2 = new Button(
    () -> changeBackground2(),
    400, 400,
    200, 50,
    "ellipse",
    color(0),
    color(100)
  );
}

void changeBackground1() {
  if (backgroundColor == color(255,0,0)) {
     backgroundColor = color(0,255,0);
  } else if (backgroundColor == color(0,255,0)) {
     backgroundColor = color(0,0,255);
  } else if (backgroundColor == color(0,0,255)) {
     backgroundColor = color(255,0,0);
  } else {
    backgroundColor = color(255,0,0);
  }
}

void changeBackground2() {
  if (backgroundColor == color(255,255,0)) {
     backgroundColor = color(0,255,255);
  } else if (backgroundColor == color(0,255,255)) {
     backgroundColor = color(255,0,255);
  } else if (backgroundColor == color(255,0,255)) {
     backgroundColor = color(255,255,0);
  } else {
     backgroundColor = color(255,255,0);
  }
}


void draw() {
  background(backgroundColor);
  button1.render();
  button2.render();
}

void mousePressed() {
  button1.mousePressed();
  button2.mousePressed();
}
