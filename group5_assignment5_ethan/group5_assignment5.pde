/**
 * 3D Camera in Processing with:
 *   - WASD movement (continuous)
 *   - Left/Right arrows => turn head left/right (yaw about camera's own Y axis)
 *   - Up/Down arrows => pitch the camera (Up arrow => pitch down)
 *   - Q/E => roll around camera's forward axis
 *   - A/D reversed from typical so that A goes RIGHT, D goes LEFT
 *   - Up/Down reversed so that Up arrow pitches camera downward, etc.
 *
 * Starting orientation: behind & above origin, looking slightly down.
 *
 * Rotation Order: Roll -> Pitch -> Yaw
 * so that yaw is around the local Y axis last, like turning your head.
 */

float moveSpeed = 5;       // movement step size
float turnSpeed = 0.03;    // rotation step (radians)

// Camera position
PVector camPos = new PVector(0, 200, 200);

// Camera orientation (Euler angles)
float yaw   = 0;                         // left/right turn around local Y
float pitch = -(float) Math.PI/4;        // look up/down
float roll  = 0;                         // roll about Z

// Key states for continuous movement/rotation
boolean wDown, sDown, aDown, dDown;
boolean leftDown, rightDown, upDown, downDown;
boolean qDown, eDown;

// Your Dog object
Dog dog;

void setup() {
  size(800, 600, P3D);
  dog = new Dog(0, 0, 0);
  smooth();
}

void draw() {
  background(200);

  // Render the dog before or after the camera set—depending on your needs.
  // Kept as in your original code:
  dog.render();
  dog.move();
  
  //-----------------------------------------
  // 1) Continuous rotation from key states
  //-----------------------------------------
  // Left/Right arrows => Yaw
  if (leftDown) {
    yaw -= turnSpeed;
  }
  if (rightDown) {
    yaw += turnSpeed;
  }

  // Up/Down arrows => Pitch
  // (Up arrow => pitch camera downward)
  if (upDown) {
    pitch -= turnSpeed;
    pitch = constrain(pitch, -HALF_PI + 0.01, HALF_PI - 0.01);
  }
  // (Down arrow => pitch camera upward)
  if (downDown) {
    pitch += turnSpeed;
    pitch = constrain(pitch, -HALF_PI + 0.01, HALF_PI - 0.01);
  }

  // Q/E => Roll
  if (qDown) {
    roll += turnSpeed; // roll "left"
  }
  if (eDown) {
    roll -= turnSpeed; // roll "right"
  }

  //-----------------------------------------
  // 2) Build orientation matrix: Roll -> Pitch -> Yaw
  //-----------------------------------------
  PMatrix3D orientation = new PMatrix3D();

  // 1) Roll around Z
  orientation.rotateZ(roll);
  // 2) Pitch around X
  orientation.rotateX(pitch);
  // 3) Yaw around Y
  orientation.rotateY(yaw);

  // Apply that to our base forward (0,0,-1) and up (0,1,0) vectors
  PVector forward = new PVector(0, 0, -1);
  PVector up      = new PVector(0, 1,  0);

  orientation.mult(forward, forward);
  orientation.mult(up, up);

  //-----------------------------------------
  // 3) WASD movement
  //    "A" => right, "D" => left
  //-----------------------------------------
  // We'll compute 'right' as the cross of forward & up
  PVector right = forward.cross(up).normalize();

  if (wDown) camPos.add(PVector.mult(forward, moveSpeed));
  if (sDown) camPos.sub(PVector.mult(forward, moveSpeed));
  // Note: A/D reversed from typical (A => right, D => left)
  if (dDown) camPos.add(PVector.mult(right, moveSpeed));
  if (aDown) camPos.sub(PVector.mult(right, moveSpeed));

  //-----------------------------------------
  // 4) Set the camera
  //-----------------------------------------
  PVector lookAt = PVector.add(camPos, forward);

  camera(camPos.x, camPos.y, camPos.z,
         lookAt.x, lookAt.y, lookAt.z,
         up.x,     up.y,     up.z);

  //-----------------------------------------
  // 5) Draw scene
  //-----------------------------------------
  drawAxes();
  drawXYPlaneGrid(400, 20);
}

//-----------------------------------------
// KEY PRESSED -> set booleans to true
//-----------------------------------------
void keyPressed() {
  switch (key) {
    case 'w': case 'W': wDown = true; break;
    case 's': case 'S': sDown = true; break;
    case 'a': case 'A': aDown = true; break;
    case 'd': case 'D': dDown = true; break;
    case 'q': case 'Q': qDown = true; break;
    case 'e': case 'E': eDown = true; break;
  }
  switch (keyCode) {
    case LEFT:  leftDown  = true; break;
    case RIGHT: rightDown = true; break;
    case UP:    upDown    = true; break;
    case DOWN:  downDown  = true; break;
  }
}

//-----------------------------------------
// KEY RELEASED -> set booleans to false
//-----------------------------------------
void keyReleased() {
  switch (key) {
    case 'w': case 'W': wDown = false; break;
    case 's': case 'S': sDown = false; break;
    case 'a': case 'A': aDown = false; break;
    case 'd': case 'D': dDown = false; break;
    case 'q': case 'Q': qDown = false; break;
    case 'e': case 'E': eDown = false; break;
  }
  switch (keyCode) {
    case LEFT:  leftDown  = false; break;
    case RIGHT: rightDown = false; break;
    case UP:    upDown    = false; break;
    case DOWN:  downDown  = false; break;
  }
}

//-----------------------------------------
// Draw the X/Y/Z axes
//-----------------------------------------
void drawAxes() {
  strokeWeight(2);

  // X axis: red
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);

  // Y axis: green
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);

  // Z axis: blue
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
}

//-----------------------------------------
// Draw a grid on the XY plane
//-----------------------------------------
void drawXYPlaneGrid(int size, int step) {
  strokeWeight(1);
  stroke(150);
  for (int y = -size; y <= size; y += step) {
    line(-size, y, 0, size, y, 0);
  }
  for (int x = -size; x <= size; x += step) {
    line(x, -size, 0, x, size, 0);
  }
}
