import themidibus.*;

MidiBus mbus;

float t1 = 0;
float t2 = 0;
float aMult = 4.0;
float bMult = 5.0;
int m = 8;
float n1 = 1.25;
float div = 1.0;

void setup() {
    size(500, 500);
    smooth(8);
    noFill();
    strokeWeight(2);
    mbus = new MidiBus(this, 2, -1);
}

void controllerChange(int channel, int number, int value) {
    println("channel: " + channel + ", number: " + number + ", value: " + value);
    if (channel != 0) {
    	return;
    }
    if (number == 6) {
    	if (value == 1) {
    		m += 1;
    	} else {
        	m -= 1;
    	}
    }
    if (number == 7) {
        if (value == 1) {
            aMult += 0.5;
        } else {
            aMult -= 0.5;
        }
    }
    if (number == 8) {
        if (value == 1) {
            bMult += 0.5;
        } else {
            bMult -= 0.5;
        }
    }
    if (number == 9) {
        if (value == 1) {
            n1 += 0.05;
        } else {
            n1 -= 0.05;
        }
    }
    if (number == 10) {
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
    text(m, 10, 20);
    text(aMult, 50, 20);
    text(bMult, 10, 40);
    text(n1, 50, 40);
    text(div, 10, 60);
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
    return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}
