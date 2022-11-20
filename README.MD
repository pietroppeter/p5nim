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

    setup:
      createCanvas(400, 400)
      background(200)
      
    draw:
      if mouseIsPressed:
        fill(0)
      else:
        fill(255)
      ellipse(mouseX, mouseY, 40, 40)
      
As you see from the code above ([live](https://pietroppeter.github.io/p5nim/get_started.html)), using p5nim is almost identical to using p5.js, save for the syntax.

There are a number of procedures that p5 needs to know about and they have to be declared with the {.exportc.} pragma. In p5nim we provide templates that remove the necessity to declare procs with {.exportc.}. The full list is in [src/p5/p5sugar.nim](src/p5/p5sugar.nim).

When converting examples from p5js there are some common pitfalls:

- functions are defined for a `type PNumber = int or float` and if there
  are multiple types in the call they must be all `int`s or all `float`s.
  Convert appropriately.
- in the examples there are frequent operations between `int`s and `float`s.
  It might be useful to use `std / lenientops`
- some variables (e.g. `key`) are `cstring` (backend compatible strings)
  and you might need to convert them with `$` before using them
- when porting an example containing objects you will need to change more stuff, see example [okazz_220919a](https://pietroppeter.github.io/p5nim/get_started.html):
  - nim support for forward declaration is experimental, better to define your object before its usage in setup and draw.
  - you will need to declare the type of object. You can pick it to be a `ref object` or a plain `object` (in the examples currently I am mostly using `ref object`, see [this commit](https://github.com/pietroppeter/p5nim/commit/c838f0be6b8871ed48e5c0c7f34f6696e68f1bd1#diff-741692b20db42d00eea54f57dc8b7536948a4dea0200c0c99fa7b9b5566195c9) for an example of changes between the two approaches)

## Contribute

- go through the [examples on p5js site](https://p5js.org/examples/), pick one that you like and convert it to nim. You might want to copy and adapt last example from `docsrc` (look at the index to find out what is the last one). You will need to increment the example number, add a title and a description. It is pretty fun!
  - you will have to commit the html in docs, and rerun also `nim r index`
    (which uses data from `docs\index.json`)
  - as you find out new conversion pitfalls update the readme up there
- an excellent source of open art is [openprocessing](https://openprocessing.org)
- ideas on how to improve the bindings (do we really need that awkward `PNumber` typeclass)? I am all ears! (currently considering to use float everywhere and add a converter from int to float)
