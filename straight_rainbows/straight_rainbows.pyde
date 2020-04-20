n = 30
locations = []
velocities = []
colors = []
pg = None
v0 = 1.2
ratio = 0.5
maxDistance = 180

def setup():
    # if ratio == 1:
    #     fullScreen()
    size(int(1920 * ratio), int(1080 * ratio), P2D)
    smooth(2)
    pixelDensity(2)
    background(0)
    colorMode(HSB, 360, 100, 100)

    for i in range(n):
        locations.append(
            PVector(random(width), random(height))
        )
        velocities.append(
            PVector(random(v0 * -1, v0), random(v0 * -1, v0))
        )
        colors.append(
            color(
                random(260) + 100, 
                80,
                random(60, 100)))
    global pg
    pg = createGraphics(width / 2, height / 2, P2D)

def draw():
    pg.beginDraw()
    pg.fill(0, 10)
    pg.rect(0, 0, width, height)

    for i in range(n):
        for j in range(i + 1, n):
            distance = locations[i].dist(locations[j])
            if distance < maxDistance:
                pg.stroke(colors[i])
                pg.strokeWeight(10 - distance / 20)
                pg.line(
                    locations[i].x, 
                    locations[i].y, 
                    locations[j].x, 
                    locations[j].y)
    pg.noStroke()
    for location, velocity in zip(locations, velocities):
        location.add(velocity)
        if not (0 < location.x < width):
            velocity.x *= -1
        if not (0 < location.y < height):
            velocity.y *= -1
    pg.endDraw()
    
    # top left
    image(pg, 0, 0)

    # top right
    pushMatrix()
    translate(width, 0)
    scale(-1, 1)
    image(pg, 0, 0)
    popMatrix()

    # bottom left
    pushMatrix()
    translate(0, height)
    scale(1, -1)
    image(pg, 0, 0)
    popMatrix()

    # bottom right
    pushMatrix()
    translate(width, height)
    scale(-1, -1)
    image(pg, 0, 0)
    popMatrix()

    # saveFrame("render/symmetry-####.png")
