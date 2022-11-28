type
  Color* = ref object

  Touche* = ref object
    x {.importc.}: float
    y {.importc.}: float
    id {.importc.}: int
  File* = ref object

  Image* = ref object
    width* {.importc.}: float
    height* {.importc.}: float
    pixels* {.importc.}: seq[float]

  Vector* = ref object
    x* {.importc.}: float
    y* {.importc.}: float
    z* {.importc.}: float

  Graphics* = ref object
    pixels*{.importc.}: seq[float]
    width*{.importc.}: float
    height*{.importc.}: float
    mouseX* {.importc.}: float
    mouseY* {.importc.}: float
    pmouseX* {.importc.}: float
    pmouseY* {.importc.}: float
    winMouseX* {.importc.}: float
    winMouseY* {.importc.}: float
    pwinMouseX* {.importc.}: float
    pwinMouseY* {.importc.}: float
    mouseButton* {.importc.}: cstring
    mouseIsPressed* {.importc.}: bool

  Font* = ref object

  Geometry* = ref object

  Shader* = ref object

  XML* = ref object

  PrintWriter* = ref object

  Table* = ref object

  Blob* = ref object

  P5Instance* = ref object
    mouseX*: float
    mouseY*: float
    pmouseX*: float
    pmouseY*: float
    winMouseX*: float
    winMouseY*: float
    pwinMouseX*: float
    pwinMouseY*: float
    mouseButton*: cstring
    mouseIsPressed*: bool
    keyIsPressed*: bool
    key*: cstring
    keyCode*: int
    setup*: Closure
    draw*: Closure

  InstanceClosure* = proc(s: P5Instance) {.closure.}
  Closure* = proc() {.closure.}
