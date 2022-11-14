import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(3, "Easing", """
Move the mouse across the screen and the symbol will follow.
""")
nbJsFromCode:
  import p5

  var x = 1.0
  var y = 1.0
  var easing = 0.05

  proc setup() {.exportc.} =
    createCanvas(400, 400)
    noStroke()
    
  proc draw() {.exportc.} =
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