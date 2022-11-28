import nimib, index
nbInit
nbRawHtml: """<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.2/p5.min.js" integrity="sha512-rCZdHNB0AePry6kAnKAVFMRfWPmUXSo+/vlGtrOUvhsxD0Punm/xWbEh+8vppPIOzKB9xnk42yCRZ5MD/jvvjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>"""
nb.addEntry(8, "Instances", """
This program creates a canvas in a local p5 instance using "instance mode", which allows to place a P5 instance into a specific `<div>` if desired. Otherwise this is the same example as `get_started`.
""")
nbJsFromCode:
  import jsffi, p5
  # to test that a local proc is not converted
  proc foo(): int = 400

  instance: # call with `instance("<name of my div>")` to place into specific div
    let x = 5
    let y = 10
    setup: # `setup` and `draw` are templates shadowing the global templates
      let bar = foo() # this won't be replaced, as there's no `foo` in p5 that we wrapped
      createCanvas(bar, 400) # each call will be checked against calls wrapped in the p5nim wrapper.
                             # If a name matches, it will be replaced by `p5Inst.<the call>` instead.
      background(200)

    draw:
      # similar to calls, idents are also compared with known fields of the
      # `P5Instance` type and replaced by `p5Inst.<field>` in case of a match
      if mouseIsPressed:
        fill(0)
      else:
        let fillBy = 255 # store in variable to test rewriting of real `nnkDotExpr`
        fillBy.fill # not no `()`
      mouseX.ellipse(mouseY, 40, 40) # even if used in dot expression, rewrite works
                                     # (this is a `nnkCall` with `nnkDotExpr` first child)

nbJsShowSource()
nbSave
