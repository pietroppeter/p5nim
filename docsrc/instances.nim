import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(9, "Instance mode", """
This program creates a canvas in a local p5 instance using
[instance mode](https://github.com/processing/p5.js/wiki/Global-and-instance-mode).
""")
nbText: """
Instance mode allows to place a p5 instance into a specific `<div>`
and to have multiple p5 canvas in the same document.

Thanks to nim metaprogramming capabilities, we do not need
to have a different api for instance mode, we can have the same api
we use for global mode, we only need to wrap it in a `instance` call.
This macro will make sure that all the required functions
will have an additional `sketch` argument added.

In this example we show two copies of `get_started` example.
The syntax here is explicitly contrived to make sure the `instance`
is able to check all possible syntax variations allowed by nim.
"""
nbRawHtml: "<div id=\"canvas1\"></div>"
nbCodeDisplay(nbJsFromCode):
  # to test that a local proc is not converted
  proc foo(): int = 400

  instance("canvas1"): # call with `instance("<name of my div>")` to place into specific div
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
nbText: "In this second instance we make use of `nbP5Instance` nimib convenience template:"
nbCodeDisplay(nbP5Instance):
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
nbSave
