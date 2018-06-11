float amt = .025;

void setup() {

  fullScreen();
  frameRate(1000);

}

void draw() {

  background(255);
  fill(0);
  noStroke();

  PVector tar = new PVector(mouseX, mouseY);


  for(int y_ = 0; y_ < height; y_ += 20) {
    for(int x_ = 0; x_ < width; x_ += 20) {

      float x = x_;
      float y = y_;
      if(x > tar.x) {
        x = x + abs(tar.x - x) / (dist(x, y, tar.x, tar.y) * amt);
      } else {
        x = x  - abs(tar.x - x) / (dist(x, y, tar.x, tar.y) * amt);
      }

      if(y > tar.y) {
        y = y + abs(tar.y - y) / (dist(x, y, tar.x, tar.y) * amt);
      } else {
        y = y - abs(tar.y - y) / (dist(x, y, tar.x, tar.y) * amt);
      }

      ellipse(x, y, 5, 5);

    }
  }
}

void keyPressed() {

  if(keyCode == LEFT) {

    amt -= .0001;

  } else if(keyCode == RIGHT) {

    amt += .0001;

  }

}
