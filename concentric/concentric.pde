float dia;
int cnt = 250;

void setup()
{
  size(1000, 1000);
  background(0);
  noFill();
  noLoop();
  dia = sqrt(pow(width, 2) + pow(height, 2)) * 0.5f;
}

void draw()
{
  translate(width / 2, height / 2);
  for(int i = 0; i < cnt; i++)
  {
    float dPhi = 2*PI / random(1, 1000);
    float dR =  1 / pow(dPhi,2);

    float offsetPhi = random(0, 2*PI);
    float offsetR;
    if(dPhi > 0.1)
      offsetR = 0;
    else
      offsetR = random(0, map(dPhi, 0.1, 0, 0, dia));

    for(float phi = offsetPhi; phi < 2*PI+offsetPhi; phi +=dPhi)
    {
      for(float r = offsetR; r < dia; r += dR)
      {
        PVector p = new PVector(cos(phi)*r, sin(phi)*r);
        stroke(255, noise(p.x/dia, p.y/dia, i) * 155 + sqrt(r/dia) * 100);
        point(p.x, p.y);
      }
    }
  }
}
