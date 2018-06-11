import processing.pdf.*;

boolean record = false;
int ID;

float c;
float l;
PVector pos;

void setup()
{
  size(1600, 900);
  ID = (int)random(10000, 99999);
  noiseSeed(ID);
  randomSeed(ID);
  if(record)
    beginRecord(PDF, "PDF shot-" + ID + ".pdf");
  colorMode(HSB, 360, 100, 100, 256);
  background(0);
  init();
}

void init()
{
  pos = new PVector(width / 2, height / 2);
  c = random(0, 360);
  l = random(2, 8);
}

void draw()
{
  stroke((random(0, 50) + c) % 360, 100, 100, random(15, 20));
  for(int i = 0; i < 1000; i++)
  {
    float phi = random(0, 2 * PI);
    float r = random(l, 3 * l);
    PVector end = new PVector(pos.x + r * cos(phi), pos.y + r * sin(phi));
    line(pos.x, pos.y, end.x, end.y);
    pos = end;
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
}

void mousePressed()
{
  if(record)
  {
    saveFrame("PDF shot-" + ID + "-####.png");
    endRecord();
    exit();
  }
  else
  {
    saveFrame("shot-" + ID + "-####.png");
  }
}
