add_library("themidibus")

def setup():
    size(600, 400)

def draw():
    background(255, 100, 0)
    stroke(255, 255, 255)
    point(30, 30)
    fill(50, 50, 50)
    rect(50, 50, mouseX, mouseY, 5)
    rect(mouseX - 2, 0, 4, 4)
    rect(0, mouseY - 2, 4, 4)
    line(mouseX, 0, mouseX, 400)
    line(0, mouseY, 600, mouseY)
    fill(255, 255, 255)
    textSize(32)
    text(int(round(frameRate)), 500, 350)
