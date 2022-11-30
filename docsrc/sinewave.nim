import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(8, "Sine Wave", """
Render a simple sine wave. Original by Daniel Shiffman <https://p5js.org/examples/math-sine-wave.html>
""")
nbCodeDisplay(nbJsFromCode):
  const xspacing = 16 # Distance between each horizontal location
  const amplitude = 75.0 # Height of wave
  const period = 500.0 # How many pixels before the wave repeats

  var theta: float #  Start angle at 0
  var yvalues: seq[float]

  proc calcWave =
    theta+=0.02
    let dx = (TWO_PI / period) * xspacing
    for x in 0..yvalues.len:
      yvalues[x] = sin(x*dx+theta)*amplitude

  proc renderWave =
    noStroke()
    colorMode(HSB, 100)
    fill(0)
    for x in 0..yvalues.len:
      fill(25+x*2, 100, 50)
      ellipse(x*xspacing, height/2+yvalues[x], 16, 16)

  setup:
    theta = 0.0
    createCanvas(710, 400)
    let nelements = (width+16)/xspacing
    yvalues = newSeq[float](nelements.int)

  draw:
    background(0)
    calcWave()
    renderWave()

nbJsShowSource()
nbSave
