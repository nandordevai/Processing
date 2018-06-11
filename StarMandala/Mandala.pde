/**
Deepak Kumar <br>
Bryn Mawr College, Department of Computer Science <br>
Mandala-inspired composition, based on star drawing
*/

void setup() {
  size(500, 500);
  smooth();
  background(255);
  noLoop();
} //setup()

void draw() {
  drawMandala(width/2, height/2, 400);
} // draw()

void drawMandala(float cx, float cy, float r) {
  // inner star
  strokeWeight(2);
  stroke(0);
  noFill();

  float cr = r/8;
  int nSides = 6;
  int delta = 360/nSides;
  strokeWeight(2);
  for (int i=0; i < 3; i++) {
    drawStar(cx, cy, cr, nSides, delta/2);
    drawStar(cx, cy, cr, nSides, 0);
    strokeWeight(1);
    cr *= 2;
//    drawStar(cx, cy, cr, nSides, delta/2); 
//    drawStar(cx, cy, cr, nSides, 0);
//
//    //cr *= 2;
//    drawStar(cx, cy, cr*2, nSides, delta/2);
//    drawStar(cx, cy, cr*2, nSides, 0);
  }
  
  cr /= 2;
  ellipse(cx, cy, cr*2, cr*2);
  ellipse(cx, cy, cr*2+40, cr*2+40);
  float theta = 0;
  strokeWeight(2);
  for (int i=0; i < nSides; i++) {
    float x1 = cx + cr*cos(radians(theta));
    float y1 = cy + cr*sin(radians(theta));
    float x2 = cx + (20+cr)*cos(radians(theta));
    float y2 = cy + (20+cr)*sin(radians(theta));
    line(x1, y1, x2, y2);
    theta += delta;
  }
} // drawMandala()

void drawStar(float cx, float cy, float radius, int n, float deg) {
  // draws a star centered at cx, cy of radius r and with n points
  float theta = radians(deg);
  float delta = 2*PI/n; 
  float iDelta = delta/2;
  float outR = radius;
  float inR = radius/2;

  beginShape();
  for (int i = 0; i < n; i++) {
    // plot outer point
    vertex(cx+outR*cos(theta), cy+outR*sin(theta));
    // plot inner point
    vertex(cx+inR*cos(theta+iDelta), cy+inR*sin(theta+iDelta));
    theta = theta + delta;
  }
  endShape(CLOSE);
} // drawStar


