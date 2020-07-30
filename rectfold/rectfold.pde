float s = 0;
int opacity = 255;
int boxWidth = 50;
int boxHeight = 50;
int boxDepth = 20;
int hue = 0;
int num = 40;

void setup() {
    background(0);
    size(1920, 1080, P3D);
    pixelDensity(displayDensity());
    surface.setSize(960, 540);
    smooth(8);
    colorMode(HSB);
    rectMode(CENTER);
}

void draw() {
    background(0);
    directionalLight(0, 0, 150, 0, 0, -1);
    ambientLight(0, 0, 255, 100, 0, 100);
    translate(width / 2, height / 2);
    for (int i = num; i >= 0; i--) {
        hue = int(map(i, 0, num, 255, 40));
        fill(hue, 250, hue / 4, opacity);
        stroke(hue, 100, hue / 4, opacity);
        emissive(180);
        int x = i * 10;
        int y = int((i % 2 * 2 - 1) * (pow(i, 2) / 2));
        int z = i * boxDepth;
        pushMatrix();
        shearY(i / 2 * s);
        rotateZ(sin(s + 0.5));
        translate(-x, -y, -z);
        box(boxWidth, boxHeight, boxDepth);
        translate(2 * x, 2 * y, 0);
        box(boxWidth, boxHeight, boxDepth);
        popMatrix();
    }
    s += 0.002;
}
