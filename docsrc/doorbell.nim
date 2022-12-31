import nimib, index, p5
nbInit
nbUseP5
nbUseP5Sound

nb.addEntry(10, "Doorbell", """
How to load and play a sound (using [p5sound](https://p5js.org/reference/#/libraries/p5.sound)).
Adapted from [p5.SoundFile](https://p5js.org/reference/#/p5.SoundFile) reference.
""")
nbText: """
This uses the additional [p5sound](https://p5js.org/reference/#/libraries/p5.sound) library.
You will need to call `nbUseP5Sound` to use it in nimib.
Loading the sound file does not work when opening the html locally in a browser,
you will need to run a static server (e.g. [nimhttpd](https://github.com/h3rald/nimhttpd)).
"""

nbCodeDisplay(nbJsFromCode):
  const nimColor = "#ffc200"
  var doorbell: SoundFile

  preload:
    doorbell = loadSound("assets/doorbell.mp3")

  setup:
    createCanvas(200, 100)
    background(nimColor)
    text("click to play the doorbell 🛎️", 10, 20)

  mousePressed:
    play(doorbell)

nbSave