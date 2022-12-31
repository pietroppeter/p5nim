# Package

version       = "0.1.0"
author        = "Jacob Romano, Pietro Peterlongo"
description   = "Nim bindings for p5.js"
license       = "MIT"

srcDir        = "src"

# Dependencies

requires "nim >= 1.6.0"

template build(name: string) = exec "nim r docsrc/" & name

task index, "rebuild the index":
  build "index"

task examples, "rebuild all examples":
  build "get_started"
  build "flashing_canvas"
  build "easing"
  build "keyboard"
  build "polygons"
  build "okazz_220919a"
  build "okazz_221026a"
  build "sinewave"
  build "instances"
  build "doorbell"