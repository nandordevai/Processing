ArrayList<Point> points = new ArrayList<Point>();
float maxDist = 0;
int lineLength = 16;

class Point {
    int x, y, prevX, prevY;
    float speed, hue, weight, angle, angleMod;

    Point (int x, int y) {
        this.x = x;
        this.y = y;
        this.prevX = x;
        this.prevY = y;

        this.speed = random(1) * 3;
        this.hue = random(1) * 360;
        this.weight = random(1) * 10 + 1;
        this.angle = random(1) * PI;
        this.angleMod = random(1) * 0.2 + 0.05;
        if (random(1) < 0.5) {
        	this.angleMod *= -1;
    	}
    }

    void update() {
        this.prevX = this.x;
        this.prevY = this.y;
        this.x += cos(this.angle) * this.speed;
        this.y += sin(this.angle) * this.speed;
        if (random(1) < .05) {
            this.angle = floor(random(1) * 8) * PI / 4;
        }
    }
}

void setup() {
	size(1024, 768);
	smooth(8);
	pixelDensity(2);
	colorMode(HSB, 360, 100, 100, 100);
    for (int i = 0; i < 1; i++){
        points.add(new Point(0, 0));
    }
    maxDist = sqrt(width / 2 * width / 2 + height / 2 * height / 2);
    background(0);
}

void draw() {
    background(0, 5);
    translate(width / 2, height / 2);
    if (random(1) < .05 && points.size() < 20) {
        points.add(new Point(0, 0));
    }
    for (int i = 0 ; i < points.size(); i++) {
  		Point p = points.get(i);
        p.update();
        float distance = dist(0, 0, p.x, p.y);
        if (distance > maxDist) {
            points.remove(i);
            continue;
        }
        pushStyle();
        strokeWeight(p.weight * ((distance / maxDist) * 2));
        stroke(p.hue, 100, 100);
        pushStyle();
        // line(p.x, p.y, p.prevX, p.prevY);
        for (int j = 0; j < 8; j++){
            rotate(PI / 4);
            line(p.x, p.y, p.x-((p.x-p.prevX) * lineLength), p.y-((p.y-p.prevY) * lineLength));
        }
        popStyle();
        pushStyle();
        scale(-1, 1);
        for (int k = 0; k < 8; k++){
            rotate(PI / 4);
            line(p.x, p.y, p.x-((p.x-p.prevX) * lineLength), p.y-((p.y-p.prevY) * lineLength));
        }
        popStyle();
        popStyle();
    }
}
