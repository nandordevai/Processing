import numpy

def r(theta):
    return 1

def calcPoint(theta):
    x = r(theta) * cos(theta)
    y = r(theta) * sin(theta)
    return x, y

def setup():
    size(500, 500)
    noFill()
    stroke(255)
    strokeWeight(2)
    
def draw():
    background(0)
    beginShape()
    [vertex(calcPoint(theta)) for theta in [i / 10.0 for i in range(0, 32)]]
    endShape()