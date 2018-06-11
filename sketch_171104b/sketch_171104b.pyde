import random

boxes = [[x * 20, y * 20, random.randint(50, 100)] for y in range(10) for x in range(10)]

def setup():
    #fullScreen()
    size(400, 400, OPENGL)
    smooth(8)

def draw():
    global boxes
    background(0)
    noStroke()
    #spotLight(151, 102, 126, 80, 20, -40, -1, 0, 0, PI/2, 2)
    ambientLight(102, 102, 102)
    directionalLight(126, 126, 126, 0, 0, -1)
    [drawBox(b[0], b[1], b[2]) for b in boxes]

def drawBox(offsetX, offsetY, height):
    pushMatrix()
    translate(100 + offsetX, 100 + offsetY, 0)
    rotateY(mouseX / 100.0)
    rotateZ(mouseY / 100.0)
    fill(height + 50, height + 50, height * 2)
    box(20, 20, height)
    popMatrix()

