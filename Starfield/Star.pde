class Star {
    float x;
    float y;
    float z;
    int zFactor = 500;

    Star() {
        reset();
    }

    void reset() {
        x = random(-width, width);
        y = random(-height, height);
        z = random(0, width);
    }

    void move() {
        z--;
        if (z <= 0) {
            reset();
        }
    }

    void draw(int r) {
        pushMatrix();
        scale((width - z) * 0.001);
        ellipse(x / z * zFactor, y / z * zFactor, r, r);
        popMatrix();
    }
}
