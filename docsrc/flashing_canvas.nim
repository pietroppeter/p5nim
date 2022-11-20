import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(2, "Flashing canvas", "A canvas that flashes random colors (shows how to change frameRate)")
nbJsFromCode:
  import p5
  
  proc newColor(): Color =
    let
      r = random() * 255
      g = random() * 255
      b = random() * 255
      
    result = color(r, g, b)
  
  setup:
    createCanvas(500, 500)
    frameRate(3)
    
  draw:
    background(newColor())

nbJsShowSource()
nbSave