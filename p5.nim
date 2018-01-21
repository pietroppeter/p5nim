import jsffi
import math
import dom

type PNumber = int or float

var
    preload* {.exportc.}: proc(): void
    setup* {.exportc.}: proc(): void
    draw* {.exportc.}: proc(): void
    remove* {.exportc.}: proc(): void

var
    mouseX* {.importc.}: float
    mouseY* {.importc.}: float
    pmouseX* {.importc.}: float
    pmouseY* {.importc.}: float
    winMouseX* {.importc.}: float
    winMouseY* {.importc.}: float
    pwinMouseX* {.importc.}: float
    pwinMouseY* {.importc.}: float
    mouseButton* {.importc.}: any
    mouseIsPressed* {.importc.}: bool
    #procs
    mouseMoved* {.exportc.}: proc(): void
    mouseDragged* {.exportc.}: proc(): void
    mousePressed* {.exportc.}: proc(): void
    mouseReleased* {.exportc.}: proc(): void
    mouseClicked* {.exportc.}: proc(): void
    doubleClicked* {.exportc.}: proc(): void
    mouseWheel* {.exportc.}: proc(): void

var
    keyIsPressed* {.importc.}: bool
    key* {.importc.}: cstring
    keyCode* {.importc.}: int
    #procs
    keyPressed* {.exportc.}: proc(): void
    keyReleased* {.exportc.}: proc(): void
    keyTyped* {.exportc.}: proc(): void

proc keyIsDown*(code: PNumber): bool {.importc.}

type
    Touche* = ref ToucheObj
    ToucheObj* {.importc.} = object
      x: float
      y: float
      id: int

var
    touches* {.importc.}: seq[float]
    touchStarted* {.exportc.}: proc(): void
    touchMoved* {.exportc.}: proc(): void
    touchEnded* {.exportc.}: proc(): void

var
    deviceOrientation* {.importc.}: any
    accelerationX* {.importc.}: float
    accelerationY* {.importc.}: float
    accelerationZ* {.importc.}: float
    pAccelerationX* {.importc.}: float
    pAccelerationY* {.importc.}: float
    pAccelerationZ* {.importc.}: float
    rotationX* {.importc.}: float
    rotationY* {.importc.}: float
    rotationZ* {.importc.}: float
    pRotationX* {.importc.}: float
    pRotationY* {.importc.}: float
    pRotationZ* {.importc.}: float
    deviceMoved* {.exportc.}: proc(): void
    deviceTurned* {.exportc.}: proc(): void
    deviceShaken* {.exportc.}: proc(): void


proc setMoveThreshold*(value: PNumber) {.importc.}
proc setShakeThreshold*(value: PNumber) {.importc.}

{.push importc.}
var
    P2D*: any
    WEBGL*: any
    ARROW*: any
    CROSS*: any
    HAND*: any
    MOVE*: any
    TEXT*: any
    WAIT*: any
    PI*: float
    HALF_PI*: float
    QUARTER_PI*: float
    TAU*: float
    TWO_PI*: float
    DEGREES*: any
    RADIANS*: any
    DEG_TO_RAD*: float
    RAD_TO_DEG*: float
    CORNER*: any
    CORNERS*: any
    RADIUS*: any
    RIGHT*: any
    LEFT*: any
    CENTER*: any
    TOP*: any
    BOTTOM*: any
    BASELINE*: any
    POINTS*: float
    LINES*: float
    LINE_STRIP*: float
    LINE_LOOP*: float
    TRIANGLES*: float
    TRIANGLE_FAN*: float
    TRIANGLE_STRIP*: float
    QUADS*: any
    QUAD_STRIP*: any
    CLOSE*: any
    OPEN*: any
    CHORD*: any
    PIE*: any
    PROJECT*: any
    SQUARE*: any
    ROUND*: any
    BEVEL*: any
    MITER*: any
    RGB*: any
    HSB*: any
    HSL*: any
    AUTO*: any
    ALT*: any
    BACKSPACE*: any
    CONTROL*: any
    DELETE*: any
    DOWN_ARROW*: any
    ENTER*: any
    ESCAPE*: any
    LEFT_ARROW*: any
    OPTION*: any
    RETURN*: any
    RIGHT_ARROW*: any
    SHIFT*: any
    TAB*: any
    UP_ARROW*: any
    BLEND*: any
    ADD*: any
    DARKEST*: any
    LIGHTEST*: any
    DIFFERENCE*: any
    EXCLUSION*: any
    MULTIPLY*: any
    SCREEN*: any
    REPLACE*: any
    OVERLAY*: any
    HARD_LIGHT*: any
    SOFT_LIGHT*: any
    DODGE*: any
    BURN*: any
    THRESHOLD*: any
    GRAY*: any
    OPAQUE*: any
    INVERT*: any
    POSTERIZE*: any
    DILATE*: any
    ERODE*: any
    BLUR*: any
    NORMAL*: any
    ITALIC*: any
    BOLD*: any
    LINEAR*: any
    QUADRATIC*: any
    BEZIER*: any
    CURVE*: any
    STROKE*: any
    FILL*: any
    TEXTURE*: any
    IMMEDIATE*: any
    LANDSCAPE*: any
    PORTRAIT*: any

{.pop.}

#Elements
type
  Element* = ref ElementObj
  ElementObj {.importc.} = object

{.push importcpp.}

proc parent*(element: Element): Element
proc parent*(element: Element, newParent: cstring | Element | JsObject)
proc id*(element: Element): cstring
proc id*(element: Element, newId: cstring)
proc class*(element: Element): cstring
proc class*(element: Element, class: cstring)
proc mousePressed*(element: Element, arg: proc() | bool)
proc doubleClicked*(element: Element, arg: proc() | bool)
proc mouseWheel*(element: Element, arg: proc(event: JsObject) | bool)
proc mouseReleased*(element: Element, arg: proc() | bool)
proc mouseClicked*(element: Element, arg: proc() | bool)
proc mouseMoved*(element: Element, arg: proc() | bool)
proc mouseOver*(element: Element, arg: proc() | bool)
proc changed*(element: Element, arg: proc() | bool)
proc input*(element: Element, arg: proc() | bool)
proc mouseOut*(element: Element, arg: proc() | bool)
proc touchStarted*(element: Element, arg: proc() | bool)
proc touchMoved*(element: Element, arg: proc() | bool)
proc touchEnded*(element: Element, arg: proc() | bool)
proc dragOver*(element: Element, arg: proc() | bool)
proc dragLeave*(element: Element, arg: proc() | bool)
proc drop*(element: Element, callback: proc(file: File), fxn: proc())

{.pop.}

#Images
type
  Image* = ref ImageObj
  ImageObj {.importc.} = object
    width*: float
    height*: float
    pixels*: openArray[float]

{.push importcpp.}

proc loadPixels*(image: Image): void
proc updatePixels*(image: Image): void
proc updatePixels*(image: Image, x, y, w, h: PNumber): void
proc get*(image: Image): Image
proc get*(image: Image, x, y: PNumber): openArray[float]
proc get*(image: Image, x, y, w, h: PNumber): Image
proc set*(image: Image, x, y: PNumber, value: PNumber | openArray[PNumber] | Color | Image)
proc resize*(image: Image, w, h: PNumber)
proc copy*(image: Image, source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc mask*(image, maskImage: Image)
proc filter*(image: Image, filterType: any)
proc filter*(image: Image, filterType: any, value: PNumber)
proc blend*(image: Image, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any):
proc blend*(image: Image, source: Image, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
proc save*(image: Image, filename, extension: cstring)

{.pop.}

{.push importc.}

proc createImage*(w, h: int): Image
proc saveCanvas*()
proc saveCanvas*(selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#)
proc saveCanvas*(selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#, filename: cstring)
proc saveCanvas*(selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#, filename, extension: cstring)
proc saveCanvas*(filename: cstring)
proc saveCanvas*(filename, extension: cstring)
proc saveFrames*(filename, extension: cstring, duration, framerate: PNumber)
proc saveFrames*(filename, extension: cstring, duration, framerate: PNumber, callback: proc(openArray[JsObject]): void)

{.pop.}

var
    pixels* {.importc.}: openArray[float]

{.push importc.}

proc blend*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
proc blend*(sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
proc copy*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc copy*(sx, sy, sw, sh, dx, dy, dw, dh: int)
proc filter*(filterType: any)
proc filter*(filterType: any, filterParam: PNumber)
proc get*(): Image {
proc get*(x, y: PNumber): openArray[float]
proc get*(x, y, w, h: PNumber): Image
proc loadPixels*()
proc set*(x, y: PNumber, value: PNumber | openArray[PNumber] | Color | Image)
proc updatePixels*()
proc updatePixels*(x, y, w, h: PNumber)
proc loadImage*(path: cstring): Image
proc loadImage*(path: cstring, successCallback: proc(Image)): Image
proc loadImage*(path: cstring, successCallback: proc(Image), failureCallback: proc(#[ TODO: Event ]#)): Image
proc image*(img: Image | Element, x, y: PNumber)
proc image*(img: Image | Element, x, y, w, h: PNumber)
proc image*(img: Image | Element, dx, dy, dw, dh, sx, sy: PNumber)
proc image*(img: Image | Element, dx, dy, dw, dh, sx, sy, sw, sh: PNumber)
proc tint*(v1, v2, v3: PNumber)
proc tint*(v1, v2, v3, alpha: PNumber)
proc tint*(value: cstring)
proc tint*(value: cstring, alpha: PNumber)
proc tint*(values[]: openArray[PNumber])
proc tint*(color: Color)
proc noTint*()
proc imageMode*(mode: any)

{.pop.}

#Vectors
type
    Vector* = ref VectorObj
    VectorObj* {.importcpp.} = object
        x*: float
        y*: float
        z*: float

proc createVector*(x, y: PNumber,  z: PNumber = 0): Vector {.importc.}

{.push importcpp.}

proc toString*(self: Vector): cstring
proc set*(self: Vector, x, y: PNumber, z: PNumber = 0)
proc set*(self: Vector, source: Vector)
proc set*(self: Vector, source: array[2, PNumber] | array[3, PNumber])
proc copy*(self: Vector): Vector
proc add*(self: Vector, other: Vector | array[2, PNumber] | array[3, PNumber])
proc add*(self: Vector, x, y: float, z: float = 0)
proc sub*(self: Vector, other: Vector | array[2, PNumber] | array[3, PNumber])
proc sub*(self: Vector, x, y: float, z: float = 0)
proc mult*(self: Vector, scalar: PNumber) 
proc `div`*(self: Vector, scalar: PNumber)
proc mag*(self: Vector): float
proc magSqr*(self: Vector): float
proc dot*(self: Vector, other: Vector): float
proc dot*(self: Vector, x, y, z: PNumber): float
proc cross*(self: Vector, other: Vector): Vector
proc dist*(self, other: Vector): float
proc normalize*(self: Vector): Vector
proc limit*(self: Vector, maximum: PNumber)
proc setMag*(self: Vector, mag: PNumber)
proc heading*(self: Vector): float
proc rotate*(self: Vector, angle: PNumber)
proc angleBetween*(self, other: Vector): float
proc lerp*(self: Vector, x, y, z, amt: PNumber)
proc lerp*(self, other: Vector, amt: float)
proc `array`*(self: Vector): openArray[JsObject]
proc equals*(self: Vector, other: Vector | array[3, float]): bool
proc equals*(self: Vector, x, y, z: PNumber): bool

{.pop.}

proc add*(t: typedesc[Vector], vector1, vector2: Vector): Vector {.importcpp: "p5.Vector.add(@)".}
proc sub*(t: typedesc[Vector], vector1, vector2: Vector): Vector {.importcpp: "p5.Vector.sub(@)".}
proc mult*(t: typedesc[Vector], vector: Vector, scalar: PNumber): Vector {.importcpp: "p5.Vector.mult(@)".}
proc `div`*(t: typedesc[Vector], vector: Vector, scalar: PNumber): Vector {.importcpp: "p5.Vector.div(@)".}
proc mag*(t: typedesc[Vector], vector: Vector): float {.importcpp: "p5.Vector.mag(@)".}
proc dot*(t: typedesc[Vector], vector1, vector2: Vector): float {.importcpp: "p5.Vector.dot(@)".}
proc cross*(t: typedesc[Vector], vector1, vector2: Vector): Vector {.importcpp: "p5.Vector.cross(@)".}
proc dist*(t: typedesc[Vector], vector1, vector2: Vector): float {.importcpp: "p5.Vector.dist(@)".}
proc lerp*(t: typedesc[Vector], vector1, vector2: Vector): Vector {.importcpp: "p5.Vector.lerp(@)".}
proc fromAngle*(t: typedesc[Vector], angle: PNumber): Vector {.importcpp: "p5.Vector.fromAngle(@)".}
proc random2D*(t: typedesc[Vector]): Vector {.importcpp: "p5.Vector.random2D()".}
proc random3D*(t: typedesc[Vector]): Vector {.importcpp: "p5.Vector.random3D()".}

#Colors
type
  Color* = ref ColorObj
  ColorObj {.importc.} = object

{.push importc.}

proc color*(channel1, channel2, channel3: PNumber): Color {.importc.}
proc color*(channel1, channel2, channel3, alpha: PNumber): Color {.importc.}
proc color*(gray: PNumber): Color {.importc.}
proc color*(gray, alpha: PNumber): Color {.importc.}
proc color*(str: cstring): Color {.importc.}
proc lerpColor*(color1, color2: Color, amount: PNumber): Color

{.pop.}

{.push importcpp.}

proc toString*(color: Color): cstring
proc setRed*(color: Color, value: PNumber)
proc setGreen*(color: Color, value: PNumber)
proc setBlue*(color: Color, value: PNumber)
proc setAlpha*(color: Color, value: PNumber)
proc red*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc red*(color: cstring): PNumber
proc blue*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc blue*(color: cstring): PNumber
proc green*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc green*(color: cstring): PNumber
proc alpha*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc alpha*(color: cstring): PNumber
proc hue*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc hue*(color: cstring): PNumber
proc saturation*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc saturation*(color: cstring): PNumber
proc lightness*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc lightness*(color: cstring): PNumber
proc brigthness*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber
proc brigthness*(color: cstring): PNumber

{.pop.}

#Graphics
type
    Graphics* = ref GraphicsObj
    GraphicsObj {.importc.} = object

{.push importc.}

proc createCanvas*(width, height: PNumber)
proc createCanvas*(width, height: PNumber, renderMode: any)
proc resizeCanvas*(width, height: PNumber)
proc resizeCanvas*(width, height: PNumber, noRedraw: bool)
proc noCanvas*()
proc createGraphics*(width, height: PNumber): Graphics
proc createGraphics*(width, height: PNumber, renderMode: any): Graphics
proc blendMode*(mode: any)

proc noLoop*()
proc loop*()
proc push*()
proc pop*()
proc redraw*()
proc redraw*(n: int)

{.pop.}

#Vertex
{.push importc.}

proc beginCountour*()
proc beginShape*()
proc beginShape*(mode: any)
proc bezierVertex*(x2, y2, x3, y3, x4, y4: PNumber)
proc curveVertex*(x, y: PNumber)
proc endContour*()
proc endShape*(mode: any)
proc quadraticVertex*(cx, cy, x3, y3: PNumber)
proc vertex*(x, y: PNumber)
proc vertex*(x, y, z, u, v: PNumber)

{.pop.}

#Global drawing procedures
{.push importc.}

proc background*(channel1, channel2, channel3: PNumber)
proc background*(channel1, channel2, channel3, alpha: PNumber)
proc background*(gray: PNumber)
proc background*(gray, alpha: PNumber)
proc background*(str: cstring)
proc background*(color: Color)
proc background*(image: Image)
proc clear*()
proc colorMode*(mode: any)
proc colorMode*(mode: any, max: PNumber)
proc colorMode*(mode: any, max1, max2, max3: PNumber)
proc colorMode*(mode: any, max1, max2, max3, maxAlpha: PNumber)
proc fill*(channel1, channel2, channel3: PNumber)
proc fill*(channel1, channel2, channel3: PNumber, alpha: PNumber)
proc fill*(gray: PNumber)
proc fill*(gray: PNumber, alpha: PNumber)
proc fill*(str: cstring)
proc fill*(str: cstring, alpha: PNumber)
proc fill*(color: Color)
proc fill*(color: Color, alpha: PNumber)
proc noFill*()
proc noStroke*()
proc stroke*(channel1, channel2, channel3: PNumber)
proc stroke*(channel1, channel2, channel3: PNumber, alpha: PNumber)
proc stroke*(gray: PNumber)
proc stroke*(gray: PNumber, alpha: PNumber)
proc stroke*(str: cstring)
proc stroke*(str: cstring, alpha: PNumber)
proc stroke*(color: Color)
proc stroke*(color: Color, alpha: PNumber)

{.pop.}

#2D Primitives
{.push importc.}

proc arc*(x, y, width, height, start, stop: PNumber)
proc arc*(x, y, width, height, start, stop: PNumber, mode: cstring)
proc ellipse*(x, y, diameter: PNumber)
proc ellipse*(x, y, width, height: PNumber)
proc line*(x1, y1, x2, y2: PNumber)
proc point*(x, y: PNumber)
proc quad*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc rect*(x, y, width, height: PNumber)
proc rect*(x, y, width, height, tl, tr, bl, br: PNumber)
proc rect*(x, y, width, height, detailX, detailY: PNumber)
proc triangle*(x1, y1, x2, y2, x3, y3: PNumber)

{.pop.}

#Rendering settings
{.push importc.}

proc ellipseMode*(mode: cstring)
proc noSmooth*()
proc rectMode*(mode: cstring)
proc smooth*()
proc strokeCap*(mode: cstring)
proc strokeJoin*(mode: cstring)
proc strokeWeight*(weight: PNumber)

{.pop.}

#Curves
{.push importc.}

proc bezier*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc bezier*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber)
proc bezierDetail*(detail: PNumber)
proc bezierPoint*(a, b, c, d, t: PNumber): PNumber
proc bezierTangent*(a, b, c, d, t: PNumber): PNumber
proc curve*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc curve*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber)
proc curveDetail*(detail: PNumber)
proc curveTightness*(tightness: PNumber)
proc curvePoint*(a, b, c, d, t: PNumber): PNumber
proc curveTangent*(a, b, c, d, t: PNumber): PNumber

{.pop.}

#Log helper
proc print*(content: untyped) {.importc.}

#Settings
{.push importc.}

var frameCount*: int
var focused*: bool
proc cursor*(imgagePath: cstring)
proc cursor*(constant: any)
proc frameRate*(fps: PNumber)
proc frameRate*(): float
proc noCursor*()
var displayWidth*: float
var displayHeight*: float
var windowWidth*: float
var windowHeight*: float
var width*: float
var height*: float
proc fullscreen*(isFullScreen: bool)
proc fullscreen*(): bool
proc pixelDensity*(density: PNumber)
proc pixelDensity*(): float
proc displayDensity*(): float
proc getURL*(): cstring
proc getURLPath*(): openarray[cstring]
proc getURLParams*(): JsObject

{.pop.}

#Transforms
{.push importc.}

proc applyMatrix*(a, b, c, d, e, f: PNumber)
proc popMatrix*()
proc pushMatrix*()
proc printMatrix*()
proc resetMatrix*()
proc rotate*(angle: PNumber)
proc rotate*(angle: PNumber, axis: array[3, PNumber] | Vector)
proc rotateX*(radians: PNumber)
proc rotateY*(radians: PNumber)
proc rotateZ*(radians: PNumber)
proc scale*(s: PNumber | Vector | array[3, PNumber])
proc scale*(s: PNumber | Vector | array[3, PNumber], y: PNumber)
proc scale*(s: PNumber | Vector | array[3, PNumber], z: PNumber)
proc scale*(s: PNumber | Vector | array[3, PNumber], y, z: PNumber)
proc shearX*(angle: PNumber)
proc shearY*(angle: PNumber)
proc translate*(x, y: PNumber)
proc translate*(x, y, z: PNumber)

{.pop.}

#Random
{.push importc.}

proc randomSeed*(seed: PNumber)
proc random*(): float
proc random*(maximum: PNumber): float
proc random*(arr: openArray[T]): T
proc random*(minumum, maximum: float): float
proc randomGaussian*(): float
proc randomGaussian*(mean: PNumber): float
proc randomGaussian*(mean, sd: PNumber): float

{.pop.}

#Trigonometry
{.push importc.}

proc acos*(value: PNumber): float
proc asin*(value: PNumber): float
proc atan*(value: PNumber): float
proc atan2*(x, y: PNumber): float
proc cos*(value: PNumber): float
proc sin*(value: PNumber): float
proc tan*(value: PNumber): float
proc degrees*(value: PNumber): float
proc radians*(value: PNumber): float
proc angleMode*(mode: any)

{.pop.}

#Typography

type
  Font* = ref FontObj
  FontObj* {.importcpp.} = object

{.push importc.}

proc textAlign*(horizAlign: any): float
proc textAlign*(horizAlign, vertAlign: any): float
proc textLeading*(): float
proc textLeading*(leading: PNumber)
proc textSize*(): float
proc textSize*(size: PNumber)
proc textStyle*(): cstring
proc textStyle*(style: any)
proc textWidth*(text: cstring): float
proc textAscent*(): float
proc textDescent*(): float
proc loadFont*(path: cstring): Font
proc loadFont*(path: cstring, callback: proc()): Font
proc text*(text: cstring, x, y: PNumber)
proc text*(text: cstring, x, y, x2, y2: PNumber)

{.pop.}

{.push importcpp.}

proc textFont*(): Font
proc textFont*(font: Font | cstring): Font
proc textFont*(font: Font | cstring, size: PNumber): Font
proc textBounds*(font: Font, line: cstring, x, y: PNumber): object
proc textBounds*(font: Font, line: cstring, x, y: PNumber, fontSize: PNumber): object
proc textBounds*(font: Font, line: cstring, x, y: PNumber, options: JsObject): JsObject
proc textBounds*(font: Font, line: cstring, x, y: PNumber, fontSize: PNumber, options: JsObject): JsObject
proc textToPoints*(font: Font, text: cstring, x, y: PNumber): openArray[JsObject]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, fontSize: PNumber): openArray[JsObject]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, options: JsObject): openArray[JsObject]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, fontSize: PNumber, options: JsObject): openArray[JsObject]

{.pop.}

#Noise
{.push importc.}

proc noise*(x: PNumber): PNumber
proc noise*(x, y: PNumber): PNumber
proc noise*(x, y, z: PNumber): PNumber
proc noiseDetail*(lod, falloff: PNumber)
proc noiseSeed*(seed: PNumber)

{.pop.}

#Camera
{.push importc.}

proc camera()
proc camera(x, y, z, centerX, centerY, centerZ, upX, upY, upZ: PNumber)
proc perspective*()
proc perspective*(fovy, aspect, near, far: PNumber)
proc ortho*(left, right, bottom, top, near, far: PŃumber)

{.pop.}

#Light
{.push importc.}

proc ambientLight*(v1, v2, v3: PNumber)
proc ambientLight*(v1, v2, v3, alpha: PNumber)
proc ambientLight*(color: cstring)
proc ambientLight*(color: cstring, alpha: PNumber)
proc ambientLight*(value: openArray[PNumber])
proc ambientLight*(color: Color)
proc directionalLight*(v1, v2, v3: PNumber, position: Vector)
proc directionalLight*(value: openArray[PNumber] | cstring | Color, x, y, z: PNumber)
proc directionalLight*(value: openArray[PNumber] | cstring | Color, position: Vector)
proc directionalLight*(v1, v2, v3, x, y, z: PNumber)
proc pointLight*(v1, v2, v3, x, y, z: PNumber)
proc pointLight*(v1, v2, v3, position: Vector)
proc pointLight*(value: openArray[PNumber] | cstring | Color, x, y, z: PNumber)
proc pointLight*(value: openArray[PNumber] | cstring | Color, position: Vector)

{.pop.}

type
  Geometry = ref GeometryObj
  GeometryObj {.importc.} = object

