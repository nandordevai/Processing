int numStars = 300;
Star[] stars = new Star[numStars];
int r = 2;

void setup() {
    background(0);
    fill(255);
    noStroke();
    size(800, 450);
    smooth(4);
    pixelDensity(2);
    for (int i = 0; i < numStars; i++) {
        stars[i] = new Star();
    }
}

void draw() {
    background(0);
    translate(width / 2, height / 2);
    for (int i = 0; i < stars.length; i++) {
        stars[i].move();
        stars[i].draw(r);
    }
}
