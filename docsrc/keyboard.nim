import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(4, "Keyboard", """
Click on the image to give it focus and press the letter keys to create forms in time and space. Each key has a unique identifying number. These numbers can be used to position shapes in space.
""")
nbJsFromCode:
  import p5, math

  var rectWidth: float
  
  proc setup() {.exportc.} =
    createCanvas(720, 400)
    noStroke()
    background(230)
    rectWidth = width / 4
  
  proc draw() {.exportc.} =
    ## keep draw() here to continue looping while waiting for keys
    discard
  
  proc keyPressed() {.exportc.} =
    var keyIndex = -1
    if $key >= "a" and $key <= "z":
      keyIndex = ord(key[0]) - ord('a')
    if keyIndex == -1:
      ## If it's not a letter key, clear the screen
      background(230)
    else:
      ## It's a letter key, fill a rectangle
      let
        randFill_r = floor(random() * 255 + 1)
        randFill_g = floor(random() * 255 + 1)
        randFill_b = floor(random() * 255 + 1)
      fill(randFill_r, randFill_g, randFill_b)
      let x = map(keyIndex, 0, 25, 0, int(width - rectWidth))
      rect(x, 0, int(rectWidth), int(height))

nbJsShowSource()
nbSave