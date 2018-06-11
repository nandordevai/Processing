void setup()
{
  size(900, 900);
  colorMode(HSB, 360, 100, 100, 256);
  background(0);
  noFill();
}

void draw()
{
  float c = random(0, 260);
  for(int count = 0; count < 10; count++)
  {
    stroke(c + random(100), 100, 100, 120);
    float lane = (random(1) > 0.5f ? 0 : height);
    PVector anch_start = new PVector(random(width), lane);
    PVector anch_end = new PVector(random(width), height - lane);
    PVector anch_delta = PVector.sub(anch_end, anch_start);
    PVector start = new PVector(0, lane);
    PVector end = new PVector(width, lane);
    PVector delta = PVector.sub(end, start);

    for(float lerp = 0; lerp < 1; lerp += 0.01)
    {
      PVector cur_start = PVector.add(start, PVector.mult(delta, lerp));
      PVector cur_anch = PVector.add(anch_start, PVector.mult(anch_delta, lerp));
      PVector cur_end = PVector.sub(end, PVector.mult(delta, lerp));
      beginShape();
        curveVertex(cur_start.x, cur_start.y);
        curveVertex(cur_start.x, cur_start.y);
        curveVertex(cur_anch.x, cur_anch.y);
        curveVertex(cur_end.x, cur_end.y);
        curveVertex(cur_end.x, cur_end.y);
      endShape();
    }
  }
  noLoop();
}
