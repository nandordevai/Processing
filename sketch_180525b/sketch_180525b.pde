void setup() {
	size(600, 600);
	smooth(8);
	pixelDensity(2);
}

void draw() {
    background(0);
    translate(width/2, height/2);
    rotate(frameCount / 3);
    int i;
    for (i = 0; i < 8; i++) {
	    drawPart(i);
    }
}

void drawPart(int step) {
    int r1 = 20 * (frameCount % 60);
    int r2 = 100 + (frameCount % 240);
    pushMatrix();
    noFill();

    rotate(PI/4 * step);

    stroke(200 - ((step % 2) * 200), 200, 200);
    strokeWeight(1);
    ellipse(25, 25, r2, r2);

    stroke(255 - ((step % 2) * 200), 255, 255);
    strokeWeight(2);
    ellipse(10, 10, r1, r1);

    popMatrix();
}
