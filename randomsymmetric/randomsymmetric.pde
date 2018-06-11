float x1, y1, x2, y2, x1c, y1c, x2c, y2c;
float ticker;
float tick = .002;
float seed1;
float seed2;

void setup() {
    size(800, 800);
    noCursor();
    x1 = 0;
    y1 = 0;
    x2 = 0;
    y2 = 0;
    ticker = 0;
    seed1 = 5;
    seed2 = 6;
    fill(255, 255, 255, 80);
    stroke(255);
    strokeWeight(3);
    strokeCap(ROUND);
    draw();
    background(0);
}

void draw() {
    fill(30, 0, 0, 10);
    noStroke();
    rect(-10, -10, width+10, height+10);
    fill(255);
    stroke(255, 150, 0);
    for (int i = 0; i<250; i++) {
        noiseSeed((long)seed1);
        strokeWeight(map(noise(ticker*10), 0, 1, 0.5, 10));
        ticker += tick;
        x1c = x1;
        y1c = y1;
        x2c = x2;
        y2c = y2;
        noiseSeed((long)seed2);
        x1 = map(noise(ticker), 0, 1, 0, width);
        noiseSeed((long)seed2+1);
        y1 = map(noise(ticker), 0, 1, 0, height);
        x2 = width-x1;
        y2 =y1;
        line(x1c, y1c, x1, y1);
        line(x2c, y2c, x2, y2);
        if (ticker > 100000) {
            ticker = 0;
        }
    }
}
