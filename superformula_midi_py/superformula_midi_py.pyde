add_library("themidibus")

t1 = 0.0
t2 = 0.0
aMult = 4.0
bMult = 5.0
m = 8.0
n1 = 1.25
div = 1.0
controlVars = [m, aMult, bMult, n1, div]
mbus = MidiBus(this, 3, -1)

def setup():
    size(500, 500)
    smooth(8)
    noFill()
    strokeWeight(2)
    MidiBus.list()

def controllerChange(channel, number, value):
    global controlVars
    
    print(number)
    for i, var in enumerate(controlVars):
        print(i, var)
        if number == i:
            print("eq")
            if value == 1:
                controlVars[i] += 1
            else:
                controlVars[i] -= 1
            print(controlVars[i])
        break

def draw():
    global t1, t2, aMult, bMult, div, m, n1

    background(0)
    beginShape()
    translate(width / 2, height / 2)
    stroke(abs(sin(t1)) * 200, abs(cos(t1)) * 200, abs(sin(t1 * 0.75)) * 200)
    for i in range(630):
        theta = i / 100.0
        rad = r(
            theta,
            cos(t1 / div) * aMult + 1,
            sin(t2 / div) * bMult + 1,
            m,
            n1,
            cos(t2 / div) * 0.5 + 2,
            sin(t1 / div) * 0.25 + 0.75
        )
        x = rad * cos(theta) * 50
        y = rad * sin(theta) * 50
        vertex(x, y)

    endShape()
    t1 += 0.05
    t2 += 0.08
    translate(-1 * width / 2, -1 * height / 2)
    text(m, 10, 20)
    text(aMult, 50, 20)
    text(bMult, 10, 40)
    text(n1, 50, 40)
    text(div, 10, 60)

def r(theta, a, b, m, n1, n2, n3):
    return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1)

def stop():
    global mbus
    
    mbus.stop()