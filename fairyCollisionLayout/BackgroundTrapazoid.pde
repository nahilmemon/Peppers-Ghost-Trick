class BackgroundTrapazoid {

  // The PShape object
  PShape trapazoid;
  PVector vertex1, vertex2, vertex3, vertex4;
  float trapazoidHeight;
  float trapazoidBaseWidth;

  BackgroundTrapazoid (float screenHeight, float squareSide, color stroke, color fill) {
    // Determine the vertices
    vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
    vertex2 = new PVector(screenHeight/2+squareSide/2, 0);
    vertex3 = new PVector(screenHeight, screenHeight/2-squareSide/2);
    vertex4 = new PVector(0, screenHeight/2-squareSide/2);
    
    // Determine the height and base width of the trapazoid
    trapazoidHeight = vertex4.y - vertex1.y;
    trapazoidBaseWidth = vertex3.x - vertex4.x;
    
    // Create the shape
    trapazoid = createShape();
    trapazoid.beginShape();
    // Set tje fill and stroke
    trapazoid.stroke(stroke);
    trapazoid.fill(fill,204);
    // Set the vertices
    trapazoid.vertex(vertex1.x,vertex1.y);
    trapazoid.vertex(vertex2.x,vertex2.y);
    trapazoid.vertex(vertex3.x,vertex3.y);
    trapazoid.vertex(vertex4.x,vertex4.y);
    // Complete the shape
    trapazoid.endShape(CLOSE);
  }

  void display() {
    shape(trapazoid);
  }
  
  PVector vertex1() {
    vertex1 = new PVector(screenHeight/2-squareSide/2, 0);
    return vertex1;
  }
}