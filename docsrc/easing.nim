import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(3, "Easing", """
Move the mouse across the screen and the symbol will follow.
""")
nbCodeDisplay(nbJsFromCode):
  var x = 1.0
  var y = 1.0
  var easing = 0.05

  setup:
    createCanvas(400, 400)
    noStroke()
    
  draw:
    background(237, 34, 93)
    let targetX = mouseX
    let dx = targetX - x
    x += dx * easing

    let targetY = mouseY
    let dy = targetY - y
    y += dy * easing

    ellipse(x, y, 66, 66)

nbJsShowSource()
nbSave