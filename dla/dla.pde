ArrayList<Walker> walkers = new ArrayList<Walker>();
ArrayList<Walker> tree = new ArrayList<Walker>();
PVector center;
int r = 8;
int speed = 1;

void setup() {
    size(800, 600);
    colorMode(HSB, 360, 100, 100);
    pixelDensity(2);
    surface.setResizable(true);
    center = new PVector(width / 2, height - 10);
    tree.add(new Walker(center, true));
}

void draw() {
    background(0);
    for (int i = 0; i < speed; i++) {
        calculate();
    }
    for (Walker t : tree) {
        t.show();
    }
    for (Walker w : walkers) {
        w.show();
    }
    // if (walkers.size() == 0) {
    //     print("done");
    //     noLoop();
    // }
}

void mouseClicked() {
    for (int i = 0; i < 100; i++) {
        walkers.add(new Walker(mouseX, mouseY));
    }
}

void calculate() {
    for (int i = walkers.size() - 1; i >= 0; i--) {
        Walker w = walkers.get(i);
        if (w.isStuck(tree)) {
            w.stuck = true;
            tree.add(w);
            walkers.remove(i);
        } else {
            if (!w.walk()) {
                walkers.remove(i);
            }
        }
    }
}

class Walker {
    PVector pos;
    boolean stuck;
    PVector drift = new PVector();

    Walker(int x, int y) {
        int spread = 50;
        pos = new PVector(x, y);
        pos.add(PVector.random2D().setMag(random(50)));
        stuck = false;
        drift = pos.sub(center);
        drift.normalize();
        println(drift.x);
        println(drift.y);
    }

    Walker(PVector pos_, boolean stuck_) {
        pos = pos_;
        stuck = stuck_;
    }

    Walker() {
        pos = new PVector(random(width), random(height));
        stuck = false;
    }

    boolean isStuck(ArrayList<Walker> others) {
        for (Walker o : others) {
            float d = this.dist(pos, o.pos);
            if (d < (r * r / 4)) {
                return true;
            }
        }
        return false;
    }

    float dist(PVector aPos, PVector bPos) {
        float dx = aPos.x - bPos.x;
        float dy = aPos.y - bPos.y;
        return dx * dx + dy * dy;
    }

    void show() {
        strokeWeight(r / 2);
        stroke(0, 0, stuck ? 100 : 50);
        point(pos.x, pos.y);
    }

    boolean walk() {
        println(drift.x);
        pos.x += random(-1, 1) + drift.x;
        pos.y += random(-1, 2) + drift.y;
        // pos.add(drift);
        if (pos.y > height) {
            return false;
        }
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        return true;
    }
}