# Nim bindings for the p5.js library

[p5js](https://p5js.org) is a Javascript library used by artists, designers and programmers alike to quickly and easily express ideas, sketch concepts, make games and create interactive applications.

Go look at the [documentation](https://pietroppeter.github.io/nim-p5/) for some live examples!

Documentation is built with [nimib](https://github.com/pietroppeter/nimib/).

## Installing

This is a fork of https://github.com/Foldover/nim-p5/ which is currently
(might change in the future)
what is installed by default when using `nimble install nimp5`.

To install this library use:

    nimble install https://github.com/pietroppeter/nim-p5/


## Basic usage

    import p5
    
    proc newColor(): Color =
      let
        r = random() * 255
        g = random() * 255
        b = random() * 255
        
      result = color(r, g, b)
    
    proc setup() {.exportc.} =
      createCanvas(500, 500)
      frameRate(3)
      
    proc draw() {.exportc.} =
      background(newColor())
      
As you see from the code above, using nimp5 is almost identical to using p5.js, save for the syntax. Just remember that all the procedures that p5 needs to know about have to be declared with the {.exportc.} pragma. This is the list of such procedures:

- preload
- setup
- draw
- remove
- mouseMoved
- mouseDragged
- mousePressed
- mouseReleased
- mouseClicked
- doubleClicked
- mouseWheel
- keyPressed
- keyReleased
- keyTyped
- touchStarted
- touchMoved
- touchEnded
- deviceMoved
- deviceTurned
- deviceShaken

When converting examples from p5js there are some common pitfalls:
- functions are defined for a `type PNumber = int or float` and if there
  are multiple types in the call they must be all `int`s or all `float`s.
  Convert appropriately.
- in the examples there are frequent operations between `int`s and `float`s.
  It might be useful to use `std / lenientops`
- some variables (e.g. `key`) are `cstring` (backend compatible strings)
  and you might need to convert them with `$` before using them

## Contribute

- go through the [examples on p5js site](https://p5js.org/examples/), pick one that you like and convert it to nim. You might want to copy and adapt last example from `docsrc` (look at the index to find out what is the last one). You will need to increment the example number, add a title and a description. It is pretty fun!
  - you will have to commit the html in docs, and rerun also `nim r index`
    (which uses data from `docs\index.json`)
  - as you find out new conversion pitfalls update the readme up there
- ideas on how to improve the bindings (do we really need that awkward `PNumber` typeclass)? I am all ears!
