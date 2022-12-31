# 🌸👑 p5nim

**p5nim** is a gate in the [Nim]👑 universe that leads you to the magical world of [Processing] and [p5.js]🌸.
Or, conversely, a potentially gateway drug from [Processing]/[p5.js] to the thoroughly enjoyable,
dangerously addictive and sort of universal programming language [Nim].

More prosaically **p5nim** provides [Nim] bindings for the [p5.js] library, some syntactic sugar
and convenience functions to use it with [nimib]🐳.
In [p5nim documentation](https://pietroppeter.github.io/p5nim/) you can also
see live a number of [p5.js] examples and [openprocessing] artwork ported to Nim.
Documentation is built with [nimib], a library to publish nim code to the web.

[Processing] is language, a graphical library and IDE for artists and designers with the purpose
of teaching non-programmers the fundamentals of programming in a visual context.
The project was initiated in 2001 and it was built in Java, one of the reason being that [java applets]
were a common technology at the time to show interactive applications on the web.
[p5.js] was started in 2013 to reinterpret [Processing] for the modern web.
From its website:

> p5.js is a JavaScript library for creative coding, with a focus on making coding accessible and inclusive for artists, designers, educators, beginners, and anyone else! p5.js is free and open-source because we believe software, and the tools to learn it, should be accessible to everyone.

Note that there is also an alternative pure nim implementation inspired by p5js (which also works for native target): https://github.com/GabrielLasso/drawim

## Status

This project started as a fork of https://github.com/Foldover/nim-p5/, to fix some bugs.
It has been renamed as `p5nim`, the goal is to clean more the api to make it more Nim idiomatic,
port more examples, fix more stuff and add more convenience functions
to use it with nimib. At some point I will tag a new release and publish it on nimble.

You can install it using:

    nimble install https://github.com/pietroppeter/p5nim/

You might want instead to clone it, in order to contribute fixing stuff and adding more ported examples:

    git clone https://github.com/pietroppeter/p5nim/
    cd p5nim
    nimble develop

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
To learn how to use this the best way is to use [p5.js] documentation and port examples.

## p5sound

[p5sound](https://p5js.org/reference/#/libraries/p5.sound) is an additional library from p5js which extends p5 with sound functionalities.
A work-in-progress wrapper is available, see [doorbell](https://pietroppeter.github.io/p5nim/doorbell.html) for example of usage.

## Porting from p5js to Nim

There are a number of javascript procedures that p5js needs to know about (like `setup` and `draw`) and they have to be declared with the {.exportc.} pragma.
In p5nim we provide templates that remove the necessity to declare procs with {.exportc.}. The full list is in [src/p5/p5sugar.nim](src/p5/p5sugar.nim).

Since [Number in javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)
is actually a float, in p5nim all procedures are defined with input a `float`.
For convenience `p5nim` exports
[`lenientops`](https://nim-lang.org/docs/lenientops.html) from standard library
and a [converter](https://nim-lang.org/docs/manual.html#converters) from int to float
(in the original bindings `PNumber` - the generic number used by all functions -
is defined as `int or float`;
this behavior is currently still available under the compile time switch `p5IntOrFloat`;
it will likely be removed at some point).

When converting examples from p5js there are some common pitfalls:

- some variables (e.g. `key`) are `cstring` (backend compatible strings)
  and you might need to convert them with `$` before using them
- when porting an example containing objects you will need to change more stuff, see example [okazz_220919a](https://pietroppeter.github.io/p5nim/okazz_220919a.html):
  - nim support for forward declaration is experimental, better to define your object before its usage in setup and draw.
  - you will need to declare the type of object. You can pick it to be a `ref object` or a plain `object` (in the examples currently I am mostly using `ref object`, see [this commit](https://github.com/pietroppeter/p5nim/commit/c838f0be6b8871ed48e5c0c7f34f6696e68f1bd1#diff-741692b20db42d00eea54f57dc8b7536948a4dea0200c0c99fa7b9b5566195c9) for an example of changes between the two approaches)
- some math/random functions that seem to be available in `p5js` (such as `floor`, `random` which are defined in the 
  bindings) do not actually work, so code compiles but the canvas is not shown (you can see an error in the console).
  In those cases it is better to import `math` and `random` from stdlib
  (but you might run in conflicts, e.g. when using `sqrt` which is also defined in `p5js`)
  For an example see [okazz_221026a](https://pietroppeter.github.io/p5nim/okazz_221026a.html)
  and try removing the imports of `math` and `random`, use `floor` instead of `math.floor`
  or `random(1.0)` instead of `random.rand(1.0)`.
  This is actually something for which a solution should be found in this library (remove them from bindings?).

## Contribute

- go through the [examples on p5js site](https://p5js.org/examples/), pick one that you like and convert it to nim. You might want to copy and adapt last example from `docsrc` (look at the index to find out what is the last one). You will need to increment the example number, add a title and a description. It is pretty fun!
  - you will have to commit the html in docs, and rerun also `nim r index`
    (which uses data from `docs\index.json`)
  - as you find out new conversion pitfalls update the readme up there
- an excellent source of open art is [openprocessing]


[Nim]: https://nim-lang.org
[nimib]: https://github.com/pietroppeter/nimib/
[Processing]: https://processing.org
[java applets]: https://en.wikipedia.org/wiki/Java_applet
[p5.js]: https://p5js.org
[openprocessing]: https://openprocessing.org/
