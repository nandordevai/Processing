void setup() {
  size(500, 500);
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(0);
  beginShape();
  translate(width / 2, height / 2);
  for (float theta = 0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta,
      1, 1, 0, 1, 1, 1);
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  endShape();
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}
