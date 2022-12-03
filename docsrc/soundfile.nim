import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(1, "Soundfile", """
How to load and play a sound. Adapted from [p5.SoundFile](https://p5js.org/reference/#/p5.SoundFile) reference.
""")
nbText: "Not using the pattern `cnv.mousePressed(canvasPressed)`. How would it look like in Nim?"
nbCodeDisplay(nbJsFromCode):
  var playing = false
  const nimColor = "#ffc200"
  setup:
    createCanvas(200, 100)
    background(nimColor)
    text("click to play a sound", 10, 20)
  mousePressed:
    background(nimColor)
    if not playing:
      text("click to stop the sound", 10, 20)
      playing = true
    else:
      text("click to play a sound", 10, 20)
      playing = false


nbSave