import random

BASE_SIZE = 20
MIN_HEIGHT = 75
MAX_HEIGHT = 100
FIELD_WIDTH = 30
FIELD_LENGTH = 150

columns = [[x * BASE_SIZE, 
            y * BASE_SIZE,
            random.randint(MIN_HEIGHT, MAX_HEIGHT), # starting height
            random.randint(MAX_HEIGHT - 10, MAX_HEIGHT) # max height difference
            ] 
           for y in range(FIELD_WIDTH) for x in range(FIELD_LENGTH)]
x = 1
d = 0.5

def setup():
    # fullScreen()
    size(600, 400, OPENGL)
    smooth(8)

def getHeight(min, max):
    return min

def draw():
    global x, d

    background(0)
    # camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
    camera(width / 1.0 + x, height / 5.0, height / 1.25,
           width / 1.0 + x, height / 1.5, height / 5.0,
           0, 1, 0)
    noStroke()
    ambientLight(150, 150, 150)
    directionalLight(126, 126, 126, 0, 0.5, -1)
    [drawBox(b[0], b[1], b[2], x) for b in columns]
    if x in (0, 800):
        d = -d
    x = x + d
    #saveFrame("frames/####.png")

def drawBox(offsetX, offsetZ, height, i):
    if height > MIN_HEIGHT + (MAX_HEIGHT - MIN_HEIGHT) / 2:
        cHeight = height - sin(i / 30) * 20 + sin(offsetZ / 50) * sin(offsetX / 50) * 5
    else:
        cHeight = height + sin(i / 20) * 10 - sin(offsetZ / 50) * sin(offsetX / 50) * 5
    pushMatrix()
    translate(offsetX - 500, 350 - cHeight / 2, offsetZ - 350)
    fill(sin(i / 50) * 200, offsetX / 10, cHeight * 2)
    box(BASE_SIZE, cHeight, BASE_SIZE)
    popMatrix()