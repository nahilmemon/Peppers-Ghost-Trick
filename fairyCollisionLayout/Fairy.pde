class Fairy {
  BackgroundTrapazoid bgTrapazoid;
  PVector fairyPosition;
  float fairyRadius;
  // for collision detection with the trapazoid boundary
  float r, x1, y1, x2, y2, cx, cy, x3, y3, x4, y4;
  boolean intersectLeft, intersectRight;
  
  Fairy(BackgroundTrapazoid bgTrapazoid, float radius) {
    fairyPosition = new PVector(bgTrapazoid.trapazoidHeight*1/3,bgTrapazoid.trapazoidHeight*5/6);
    fairyRadius = radius;
    

    
    // Determining Left Trapazoid Boundary Coordinates
    x1 = bgTrapazoid.vertex1.x;
    y1 = bgTrapazoid.vertex1.y;
    x4 = bgTrapazoid.vertex4.x;
    y4 = bgTrapazoid.vertex4.y;
    
    // Determining Right Trapazoid Boundary Coordinates
    x2 = bgTrapazoid.vertex2.x;
    y2 = bgTrapazoid.vertex2.y;
    x3 = bgTrapazoid.vertex3.x;
    y3 = bgTrapazoid.vertex3.y;
    
    // Fairy Details
    r = fairyRadius;
    cx = fairyPosition.x;
    cy = fairyPosition.y;
    
    intersectLeft = false;
    intersectRight = false;
  }

  void display() {
    println(bgTrapazoid.vertex1());
    fill(255,0,0,204);
    ellipse(fairyPosition.x, fairyPosition.y, fairyRadius*2, fairyRadius*2);
  }
  
  void move() {
    cx = fairyPosition.x;
    cy = fairyPosition.y;
    intersectLeft = lineCircleCollision(x1,y1,x4,y4,cx,cy,r);
    intersectRight = lineCircleCollision(x2,y2,x3,y3,cx,cy,r);
    
    if (moveUp == true) {
      if (fairyPosition.y - fairyRadius <= bgTrapazoid.vertex1.y) {
        stroke(255,0,255);
      } else if (intersectRight == true || intersectLeft == true) {
        stroke(255,255,255);
      } else {
        fairyPosition.y -= 1;
      }
    }
    if (moveDown == true) {
      if (fairyPosition.y + fairyRadius >= bgTrapazoid.vertex3.y) {
        stroke(0,255,255);
      } else {
        fairyPosition.y += 1;
      }
    }
    if (moveLeft == true) {
      if (intersectLeft == true) {
        stroke(255,0,0);
      } else {
        fairyPosition.x -= 1;
      }
    }
    if (moveRight == true) {
      if (intersectRight == true) {
        stroke(0,0,255);
      } else {
        fairyPosition.x += 1;
      }
    }
    println(fairyPosition);
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
  
  void changeBackgroundTrapazoid(BackgroundTrapazoid newBgTrapazoid) {
    bgTrapazoid = newBgTrapazoid;
    fairyPosition.x = bgTrapazoid.trapazoidHeight*1/3;
    fairyPosition.y = bgTrapazoid.trapazoidHeight*5/6;
    fairy.display();
  }

  
}