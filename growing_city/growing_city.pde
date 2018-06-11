// FIXME
int BASE_SIZE = 20;
int MIN_HEIGHT = 75;
int MAX_HEIGHT = 100;
int FIELD_WIDTH = 30;
int FIELD_LENGTH = 150;

// columns = [[x * BASE_SIZE,
//             y * BASE_SIZE,
//             random.randint(MIN_HEIGHT, MAX_HEIGHT), # starting height
//             random.randint(MAX_HEIGHT - 10, MAX_HEIGHT) # max height difference
//             ]
//            for y in range(FIELD_WIDTH) for x in range(FIELD_LENGTH)]
int[][][] columns;
float x = 1.0;
float d = 0.5;

void setup() {
    columns = new int[FIELD_LENGTH][FIELD_WIDTH][4];
    for (int i = 0; i < FIELD_LENGTH; i++) {
        for (int j = 0; j < FIELD_WIDTH; j++) {
            columns[i][j][0] = i * BASE_SIZE;
            columns[i][j][1] = j * BASE_SIZE;
            columns[i][j][2] = int(random(MIN_HEIGHT, MAX_HEIGHT));
            columns[i][j][3] = int(random(MAX_HEIGHT - 10, MAX_HEIGHT));
        }
    }
    size(600, 400, OPENGL);
    smooth(8);
}

void draw() {
    background(0);
    camera(width / 1.0 + x, height / 5.0, height / 1.25,
        width / 1.0 + x, height / 1.5, height / 5.0,
        0, 1, 0);
    noStroke();
    ambientLight(150, 150, 150);
    directionalLight(126, 126, 126, 0, 0.5, -1);
    // [drawBox(b[0], b[1], b[2], x) for b in columns]
    for (int i = 0; i < columns.length; i++) {
        drawBox(columns[i][0], columns[i][1], columns[i][2], x);
    }
    if (x >= 0 && x <= 800) {
        d = -d;
    }
    x = x + d;
    // saveFrame("frames/####.png")
}

void drawBox(int offsetX, int offsetZ, int _height, float i) {
    float cHeight;
    if (height > MIN_HEIGHT + (MAX_HEIGHT - MIN_HEIGHT) / 2) {
        cHeight = _height - sin(i / 30) * 20 + sin(offsetZ / 50) * sin(offsetX / 50) * 5;
    } else {
        cHeight = _height + sin(i / 20) * 10 - sin(offsetZ / 50) * sin(offsetX / 50) * 5;
    }
    pushMatrix();
    translate(offsetX - 500, 350 - cHeight / 2, offsetZ - 350);
    fill(sin(i / 50) * 200, offsetX / 10, cHeight * 2);
    box(BASE_SIZE, cHeight, BASE_SIZE);
    popMatrix();
}
