import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(2, "Flashing canvas", "A canvas that flashes random colors (shows how to change frameRate)")
nbCodeDisplay(nbJsFromCode):
  setup:
    createCanvas(500, 500)
    frameRate(1) # 1 frame every second (default is 60 frames per second)
    
  draw:
    background(random()*255, random()*255, random()*255)

nbJsShowSource()
nbSave