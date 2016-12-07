float squareSide = 136; // 1.8cm*2 -- 1 cm = 37.795275591 px; square tip of the pyramid
float screenHeight = 720; 
PVector fairyPosition;
PVector vertex1, vertex2, vertex3, vertex4;
float fairyRadius = 25;
float r, x1, y1, x2, y2, cx, cy, x3, y3, x4, y4;
boolean intersectLeft, intersectRight;

void setup () {
  size(720,720);
  background(0);
  fairyPosition = new PVector(350, 300);
  noStroke();
  fill(0,255,0);
  ellipse(fairyPosition.x, fairyPosition.y, fairyRadius*2, fairyRadius*2);
  
  vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
  vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
  vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
  vertex4 = new PVector(0, screenHeight/2-squareSide/2);
  
  // Determining Left Trapazoid Boundary Coordinates
  x1 = vertex1.x;
  y1 = vertex1.y;
  x4 = vertex4.x;
  y4 = vertex4.y;
  
  // Determining Right Trapazoid Boundary Coordinates
  x2 = vertex2.x;
  y2 = vertex2.y;
  x3 = vertex3.x;
  y3 = vertex3.y;
  
  // Fairy Details
  r = fairyRadius;
  cx = fairyPosition.x;
  cy = fairyPosition.y;
  
  intersectLeft = false;
  intersectRight = false;
  
  
}

void draw() {
  background(0);
 
  strokeWeight(3);
  stroke(0,255,0);
  fill(255);
  ellipse(cx,cy,2*r,2*r);
  line(x1,y1,x2,y2);
  line(x2,y2,x3,y3);
  line(x3,y3,x4,y4);
  line(x4,y4,x1,y1);
  fairy(vertex1, vertex2, vertex3, vertex4);
  cx = fairyPosition.x;
  cy = fairyPosition.y;
  
  intersectLeft = lineCircleCollision(x1,y1,x4,y4,cx,cy,r);
  intersectRight = lineCircleCollision(x2,y2,x3,y3,cx,cy,r);
}

boolean lineCircleCollision(float x0, float y0, float x1, float y1, float cx, float cy, float r) {
  float Dc2,t;
  // differences in x and y values between line vertices
  float dx = (x1 - x0);
  float dy = (y1 - y0);
  float dx2 = dx*dx;
  float dy2 = dy*dy;
  float dr2 = dx2 + dy2;
  float r2 = r*r;

  // vertices of line in relation to circle's center
  float xc0 = cx - x0;
  float yc0 = cy - y0;
  float xc1 = cx - x1;
  float yc1 = cy - y1;

  // Find the discriminant in relation to line vertex (x0, y0)
  float Dc1 = dx*yc0 - dy*xc0;
  float discriminantc1 = r*r*dr2 - Dc1*Dc1;
  
  // if discriminant = 0 --> the circle is touching the line at 1 point
  // if discriminant > 0 --> the circle has intersected the line at 2 points
  // if discriminant < 0 --> no collision
  if(discriminantc1 >= 0){
    // Not sure what these checks do...
    Dc2 = dx*xc0 + dy*yc0;
    t = Dc2 / dr2;
    return ((t >= 0 && t <= 1) || (xc0*xc0 + yc0*yc0 < r2) || (xc1*xc1 + yc1*yc1 < r2) );
  }
  return false;
}

void fairy(PVector vertex1, PVector vertex2, PVector vertex3, PVector vertex4) {
  
  if (key == CODED) {
    if (keyCode == UP) {
        if (fairyPosition.y - fairyRadius <= vertex1.y) {
          stroke(255,0,255);
        } else if (intersectRight == true || intersectLeft == true) {
          stroke(255,255,255);
        } else {
          fairyPosition.y -= 1;
        }
    } else if (keyCode == DOWN) {
        if (fairyPosition.y + fairyRadius >= vertex3.y) {
          stroke(0,255,255);
        } else {
          fairyPosition.y += 1;
        }
    }
    if (keyCode == LEFT) {
        if (intersectLeft == true) {
          stroke(255,0,0);
        } else {
          fairyPosition.x -= 1;
        }
    } else if (keyCode == RIGHT) {
        if (intersectRight == true) {
          stroke(0,0,255);
        } else {
          fairyPosition.x += 1;
        }
    }
  }
  ellipse(fairyPosition.x, fairyPosition.y, fairyRadius*2, fairyRadius*2);
}