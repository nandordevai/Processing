import themidibus.*;

MidiBus mbus;

float t1 = 0;
float t2 = 0;
float aMult = 4.0;
float bMult = 5.0;
float m = 8.0;
float n1 = 1.25;
float div = 1.0;

void setup() {
    size(500, 500);
    smooth(8);
    noFill();
    strokeWeight(2);
    mbus = new MidiBus(this, 3, -1);
}

void controllerChange(int channel, int number, int value) {
    if (channel != 0) {
    	return;
    }
    // this is embarrassing, I can’t believe there’s no sane way to do this
    if (number == 0) {
    	if (value == 1) {
    		m += 1;
    	} else {
        	m -= 1;
    	}
    }
    if (number == 1) {
        if (value == 1) {
            aMult += 0.5;
        } else {
            aMult -= 0.5;
        }
    }
    if (number == 2) {
        if (value == 1) {
            bMult += 0.5;
        } else {
            bMult -= 0.5;
        }
    }
    if (number == 3) {
        if (value == 1) {
            n1 += 0.05;
        } else {
            n1 -= 0.05;
        }
    }
    if (number == 4) {
        if (value == 1) {
            div += 0.05;
        } else {
            div -= 0.05;
        }
    }
}

void draw() {
    background(0);
    beginShape();
    translate(width / 2, height / 2);
    stroke(abs(sin(t1)) * 200, abs(cos(t1)) * 200, abs(sin(t1 * 0.75)) * 200);
    for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
        float rad = r(
        	theta,
            cos(t1 / div) * aMult,
            sin(t2 / div) * bMult,
            m,
            n1,
            cos(t2 / div) * 0.5 + 2,
            sin(t1 / div) * 0.25 + 0.75
        );
        float x = rad * cos(theta) * 50;
        float y = rad * sin(theta) * 50;
        vertex(x, y);
    }
    endShape();
    t1 += 0.05;
    t2 += 0.08;
    translate(-1 * width / 2, -1 * height / 2);
    text("m: " + m, 10, 20);
    text("a: " + aMult, 60, 20);
    text("b: " + bMult, 10, 40);
    text("n1: " + n1, 60, 40);
    text("d: " + div, 10, 60);
    text("Press r to reset values", 10, height - 20);
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
    return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}

void keyPressed() {
    if (key == 'r') {
        t1 = 0;
        t2 = 0;
        aMult = 4.0;
        bMult = 5.0;
        m = 8.0;
        n1 = 1.25;
        div = 1.0;
    }
}
