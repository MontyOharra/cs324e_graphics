Button normalButton1, normalButton2;
Checkbox checkbox1, checkbox2;
RadioGroup radioGroup;
RadioButton radio1, radio2, radio3;
Slider backgroundSlider;
int backgroundColor;

void setup() {
  size(800, 400); 
  backgroundColor = color(255, 0, 0); // Start with red

  // Normal Buttons (Left side) - Toggle between Blue & Yellow
  normalButton1 = new Button(
    () -> changeBackgroundBlueYellow(),
    100, 200,
    40, 20,
    "rect",
    color(255),  // White
    color(200)   // Gray
  );
  
  normalButton2 = new Button(
    () -> changeBackgroundBlueYellow(),
    200, 200,
    40, 20,
    "rect",
    color(255),  // White
    color(200)   // Gray
  );

  // Checkboxes (Middle)
  checkbox1 = new Checkbox(
    () -> println("Checkbox 1 toggled!"),
    350, 200,
    20,
    color(255),
    color(200),
    color(0, 0, 255),
    color(0, 0, 200)
  );

  checkbox2 = new Checkbox(
    () -> println("Checkbox 2 toggled!"),
    400, 200,
    20,
    color(0),
    color(100),
    color(0, 0, 255),
    color(0, 0, 200)
  );

  // Radio Buttons (Right side)
  radioGroup = new RadioGroup();

  radio1 = new RadioButton(
    radioGroup,
    () -> println("Radio 1 selected"),
    550, 200,
    20,
    color(200),
    color(150),
    color(100, 200, 100),
    color(50, 150, 50)
  );

  radio2 = new RadioButton(
    radioGroup,
    () -> println("Radio 2 selected"),
    600, 200,
    20,
    color(200),
    color(150),
    color(100, 200, 100),
    color(50, 150, 50)
  );

  radio3 = new RadioButton(
    radioGroup,
    () -> println("Radio 3 selected"),
    650, 200,
    20,
    color(200),
    color(150),
    color(100, 200, 100),
    color(50, 150, 50)
  );

  // Vertical Slider - Changes background from Red to Green
  backgroundSlider = new Slider(
    750, 50,   // x, y position
    20, 300,   // width, height
    true,      // Vertical slider
    0.2,       // Button size percentage
    color(150), // Track color (Gray)
    color(0)    // Button color (Black)
  );
}

void changeBackgroundBlueYellow() {
  if (backgroundColor == color(0, 0, 255)) {
    backgroundColor = color(255, 255, 0);
  } else {
    backgroundColor = color(0, 0, 255);
  }
}

void updateBackgroundFromSlider() {
  float sliderValue = backgroundSlider.getValue();
  backgroundColor = lerpColor(color(255, 0, 0), color(0, 255, 0), sliderValue);
}

void draw() {
  background(backgroundColor);
  backgroundSlider.update();
  
  updateBackgroundFromSlider();

  // Render UI Elements
  normalButton1.render();
  normalButton2.render();
  
  checkbox1.render();
  checkbox2.render();

  radio1.render();
  radio2.render();
  radio3.render();

  backgroundSlider.render();
}

void mousePressed() {
  normalButton1.mousePressed();
  normalButton2.mousePressed();

  checkbox1.mousePressed();
  checkbox2.mousePressed();

  radio1.mousePressed();
  radio2.mousePressed();
  radio3.mousePressed();

  backgroundSlider.mousePressed();
}

void mouseReleased() {
  backgroundSlider.mouseReleased();
}
