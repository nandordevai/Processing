PImage img;

void setup() {
    size(800, 800);
    pixelDensity(2);
	img = loadImage("amanita.jpeg");
}

void draw() {
    background(0);
    image(img, 0, 0, 800, 800);
    filter(BLUR, 20);
}
