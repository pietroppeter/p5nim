import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(1, "Get started", """
This program creates a canvas that is 400 pixels wide and 400 pixels high, and then starts drawing white circles at the position of the mouse. When a mouse button is pressed, the circle color changes to black.
""")
nbJsFromCode:
  import p5

  proc setup() {.exportc.} =
    createCanvas(400, 400)
    
  proc draw() {.exportc.} =
    if mouseIsPressed:
      fill(0)
    else:
      fill(255)
    ellipse(mouseX, mouseY, 40, 40)
nbJsShowSource()
nbSave