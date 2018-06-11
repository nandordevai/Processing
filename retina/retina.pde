int ringCnt = 100;
int circleCnt = 100;
float minR = 0.08;

void setup()
{
  size(900, 900);
  colorMode(HSB, 360, 100, 100, 256);
  background(0);
  ellipseMode(CENTER);
  noFill();
  noLoop();
}

void draw()
{
  translate(width / 2, height / 2);
  for(int i = 0; i < ringCnt; i++)
  {
    float offset = random(0, PI/2);
    float R = random(minR * width, 1/sqrt(2) * width);
    float r = (R / (width/2) - minR) * noise(R/width * 100) * width/6;
    for(float phi = 0; phi < 2 * PI; phi += (2*PI)/circleCnt)
    {
      stroke(degrees((phi+offset)%(2*PI)), 100, 100, 200);
      ellipse(cos(phi) * R, sin(phi) * R, r, r);
    }
  }
}
