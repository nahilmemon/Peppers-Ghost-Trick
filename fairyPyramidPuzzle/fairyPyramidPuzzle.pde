float squareSide = 136; // 1.8cm*2 -- 1 cm = 37.795275591 px; square tip of the pyramid
float screenHeight = 1080; 
float trapazoidHeight; // height of one face of the pyramid

void setup () {
  size(1080,1080);
  background(0); 
  
  trapazoidHeight = screenHeight/2 - squareSide/2;
  
  // draw guidelines
  guidelines();
  
  
}

void draw() {
  bottomFace();
  rightFace();
  topFace();
  leftFace();
}

void guidelines() {
  stroke(255);
  line(0,0,width,height);
  line(width,0,0,height);
  rectMode(CENTER);
  fill(0);
  rect(width*0.5, height*0.5, squareSide, squareSide);
}

void bottomFace() {
  PVector origin = new PVector(0,screenHeight/2+squareSide/2);
  pushMatrix();
  translate(origin.x, origin.y);
  PVector vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
  PVector vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
  PVector vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
  PVector vertex4 = new PVector(0, screenHeight/2-squareSide/2);
  
  beginShape();
  stroke(255,0,255);
  fill(125,0,125);
  vertex(vertex1.x,vertex1.y);
  vertex(vertex2.x,vertex2.y);
  vertex(vertex3.x,vertex3.y);
  vertex(vertex4.x,vertex4.y);
  endShape();
  popMatrix();
}

void rightFace() {
  PVector origin = new PVector(screenHeight/2+squareSide/2,screenHeight);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(270));
  PVector vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
  PVector vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
  PVector vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
  PVector vertex4 = new PVector(0, screenHeight/2-squareSide/2);
  
  beginShape();
  stroke(255,255,0);
  fill(125,125,0);
  vertex(vertex1.x,vertex1.y);
  vertex(vertex2.x,vertex2.y);
  vertex(vertex3.x,vertex3.y);
  vertex(vertex4.x,vertex4.y);
  endShape();
  popMatrix();
}

void topFace() {
  PVector origin = new PVector(screenHeight,screenHeight/2-squareSide/2);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(180));
  PVector vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
  PVector vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
  PVector vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
  PVector vertex4 = new PVector(0, screenHeight/2-squareSide/2);
  
  beginShape();
  stroke(0,255,255);
  fill(0,125,125);
  vertex(vertex1.x,vertex1.y);
  vertex(vertex2.x,vertex2.y);
  vertex(vertex3.x,vertex3.y);
  vertex(vertex4.x,vertex4.y);
  endShape();
  popMatrix();
}

void leftFace() {
  PVector origin = new PVector(screenHeight/2-squareSide/2,0);
  pushMatrix();
  translate(origin.x, origin.y);
  rotate(radians(90));
  PVector vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
  PVector vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
  PVector vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
  PVector vertex4 = new PVector(0, screenHeight/2-squareSide/2);
  
  beginShape();
  stroke(255,255,255);
  fill(125,125,125);
  vertex(vertex1.x,vertex1.y);
  vertex(vertex2.x,vertex2.y);
  vertex(vertex3.x,vertex3.y);
  vertex(vertex4.x,vertex4.y);
  endShape();
  popMatrix();
}