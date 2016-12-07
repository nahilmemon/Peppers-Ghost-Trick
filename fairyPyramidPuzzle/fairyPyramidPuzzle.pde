BackgroundTrapazoid bottomFace, topFace, leftFace, rightFace;
float squareSide = 136;
float screenHeight = 1080; //720 //1080 
Fairy fairy;
float fairyRadius = 25;
boolean moveUp, moveDown, moveLeft, moveRight;
int whichFace;
void setup() {
  size(1080, 1080);
  // For background trapazoids
  bottomFace = new BackgroundTrapazoid(screenHeight,squareSide,color(255,0,255),color(125,0,125));
  rightFace = new BackgroundTrapazoid(screenHeight,squareSide,color(255,255,0),color(125,125,0));
  topFace = new BackgroundTrapazoid(screenHeight,squareSide,color(0,255,255),color(0,125,125));
  leftFace = new BackgroundTrapazoid(screenHeight,squareSide,color(255,255,255),color(125,125,125));
  
  // Create a fairy
  fairy = new Fairy(bottomFace, fairyRadius);
  whichFace = 1;
  // For fairy movement
  moveUp = false;
  moveDown = false;
  moveLeft = false;
  moveRight = false;
}

void draw() {
  background(0);
  bottomFace();
  rightFace();
  topFace();
  leftFace();
}

void bottomFace() {
  PVector origin = new PVector(0,screenHeight/2+squareSide/2);
  pushMatrix();
  translate(origin.x, origin.y);
  bottomFace.display();
  if (whichFace == 1) {
    fairy.move();
    fairy.display();
  }
  popMatrix();
}

void rightFace() {
  PVector origin = new PVector(screenHeight/2+squareSide/2,screenHeight);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(270));
  rightFace.display();
  if (whichFace == 2) {
    // fairy.setPosition(rightFace.trapazoidHeight*1/3,rightFace.trapazoidHeight*5/6);
    fairy.move();
    fairy.display();
  }
  popMatrix();
}

void topFace() {
  PVector origin = new PVector(screenHeight,screenHeight/2-squareSide/2);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(180));
  topFace.display();
  if (whichFace == 3) {
    fairy.move();
    fairy.display();
  }
  popMatrix();
}

void leftFace() {
  PVector origin = new PVector(screenHeight/2-squareSide/2,0);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(90));
  leftFace.display();
  if (whichFace == 4) {
    fairy.move();
    fairy.display();
  }
  popMatrix();
}

void keyPressed() {
  if (key == 'w') {
    moveUp = true;
  } 
  if (key == 'a') {
    moveLeft = true;
  } 
  if (key == 's') {
    moveDown = true;
  } 
  if (key == 'd') {
    moveRight = true;
  } 
  if (key == '1') {
    whichFace = 1;
    fairy.changeBackgroundTrapazoid(bottomFace);
    println('1');
  }
  if (key == '2') {
    whichFace = 2;
    fairy.changeBackgroundTrapazoid(rightFace);
    println('2');
  }
  if (key == '3') {
    whichFace = 3;
    fairy.changeBackgroundTrapazoid(topFace);
    println('3');
  }
  if (key == '4') {
    whichFace = 4;
    fairy.changeBackgroundTrapazoid(leftFace);
    println('4');
  }
}

void keyReleased() {
  if (key == 'w') {
    moveUp = false;
  } 
  if (key == 'a') {
    moveLeft = false;
  } 
  if (key == 's') {
    moveDown = false;
  }
  if (key == 'd') {
    moveRight = false;
  }
}