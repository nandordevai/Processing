import peasy.*;

int c = 1;
PeasyCam cam;

void setup() {
    size(640, 400, P3D);
	cam = new PeasyCam(this, 0, 0, 0, 50);
}

void draw() {
    background(0);
    noStroke();
    ambientLight(150, 150, 150);
    directionalLight(126, 126, 126, 0, 0.5, -1);
    noFill();
    stroke(255);
    for (int x = 0; x < width; x+=5) {
        beginShape();
        for (int y = 0; y < height; y+=5) {
            float nx = x / width * 5;
            float ny = y / height * 5;
            vertex(x, y, noise(nx, ny));

        }
        endShape();
    }
}
