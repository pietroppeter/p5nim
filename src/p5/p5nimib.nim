template nbUseP5* =
  nb.partials["head"] &= """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.5.0/p5.min.js"></script>"""
  nbJsFromCodeGlobal:
    import p5

template nbP5Instance*(body: untyped) =
  let p5instanceId = "p5instance-" & $nb.newId()
  nbRawHtml: "<div id=\"" & p5instanceId & "\"></div>"
  nbJsFromCode(p5instanceId):
    instance(p5instanceId):
      body

template nbUseP5Sound* =
  nb.partials["head"] &= """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.5.0/addons/p5.sound.min.js"></script>"""
  nbJsFromCodeGlobal:
    import p5 / p5sound
