import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(1, "Get started", """
This program creates a canvas that is 400 pixels wide and 400 pixels high, and then starts drawing white circles at the position of the mouse. When a mouse button is pressed, the circle color changes to black.
""")
nbCodeDisplay(nbJsFromCode):
  setup:
    createCanvas(400, 400)
    background(200)
    
  draw:
    if mouseIsPressed:
      fill(0)
    else:
      fill(255)
    ellipse(mouseX, mouseY, 40, 40)
nbSave