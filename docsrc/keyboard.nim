import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(4, "Keyboard", """
Click on the image to give it focus and press the letter keys to create forms in time and space. Each key has a unique identifying number. These numbers can be used to position shapes in space.
""")
nbCodeDisplay(nbJsFromCode):
  var rectWidth: float
  
  setup:
    createCanvas(720, 400)
    noStroke()
    background(230)
    rectWidth = width / 4
  
  draw:
    ## keep draw() here to continue looping while waiting for keys
    discard
  
  keyPressed:
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
      let x = map(keyIndex, 0, 25, 0, width - rectWidth)
      rect(x, 0, rectWidth, height)

nbJsShowSource()
nbSave