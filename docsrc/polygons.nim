import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(5, "Polygons", """
What is your favorite? Pentagon? Hexagon? Heptagon? No? What about the icosagon? The polygon() function created for this example is capable of drawing any regular polygon. Also shows [possible inputs for colors](https://p5js.org/reference/#/p5/fill).
""")
nbJsFromCode:
  import p5

  proc polygon(x, y, radius, npoints: PNumber) =
    let angle = TWO_PI / npoints
    beginShape()
    var a = 0.0
    while a < TWO_PI:
      let sx = x + cos(a) * radius
      let sy = y + sin(a) * radius
      a += angle
      vertex(sx, sy)
    endShape(CLOSE)

  setup:
    createCanvas(720, 400)

  draw:
    background(102) ## grayscale

    push()
    fill(255, 204, 0) ## RGB integer values
    translate(width * 0.2, height * 0.5)
    rotate(frameCount / 200.0)
    polygon(0, 0, 82, 3)
    pop()

    push()
    fill("red") ## Named SVG/CSS color string
    translate(width * 0.5, height * 0.5)
    rotate(frameCount / 50.0)
    polygon(0, 0, 80, 20)
    pop()

    push()
    fill("#fae") ## three-digit (or six-digit) hexadecimal RGB notation
    translate(width * 0.8, height * 0.5)
    rotate(frameCount / -100.0)
    polygon(0, 0, 70, 7)
    pop()

nbJsShowSource()
nbSave