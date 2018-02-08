import jsffi
import math
import dom

type PNumber = int or float

type
    Color* = ref ColorObj
    ColorObj {.importc.} = object

    Touche* = ref ToucheObj
    ToucheObj* {.importc.} = object
        x: float
        y: float
        id: int

    Element* = ref ElementObj
    ElementObj {.importc.} = object
    
    File* = ref FileObj
    FileObj {.importc.} = object

    Image* = ref ImageObj
    ImageObj {.importc.} = object
      width* {.importc.}: float
      height* {.importc.}: float
      pixels* {.importc.}: seq[float]

    Vector* = ref VectorObj
    VectorObj* {.importcpp.} = object
        x*: float
        y*: float
        z*: float

    Graphics* = ref GraphicsObj
    GraphicsObj {.importc.} = object

    Font* = ref FontObj
    FontObj* {.importcpp.} = object

    Geometry = ref GeometryObj
    GeometryObj {.importc.} = object

    Shader* = ref ShaderObj
    ShaderObj {.importc.} = object

    XML* = ref XMLObj
    XMLObj {.importcpp.} = object

#[
    use overloadable p5 functions with exportc pragma, i.e. proc setup(): void {.exportc.} =

    preload
    setup
    draw
    remove
    mouseMoved
    mouseDragged
    mousePressed
    mouseReleased
    mouseClicked
    doubleClicked
    mouseWheel
    keyPressed
    keyReleased
    keyTyped
    touchStarted
    touchMoved
    touchEnded
    deviceMoved
    deviceTurned
    deviceShaken

]#

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

var
    keyIsPressed* {.importc.}: bool
    key* {.importc.}: cstring
    keyCode* {.importc.}: int

proc keyIsDown*(code: PNumber): bool {.importc.}

var
    touches* {.importc.}: seq[float]

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


proc setMoveThreshold*(value: PNumber) {.importc.}
proc setShakeThreshold*(value: PNumber) {.importc.}

var
    P2D* {.importc.}: any 
    WEBGL* {.importc.}: any 
    ARROW* {.importc.}: any 
    CROSS* {.importc.}: any 
    HAND* {.importc.}: any 
    MOVE* {.importc.}: any 
    TEXT* {.importc.}: any 
    WAIT* {.importc.}: any 
    PI* {.importc.}: float 
    HALF_PI* {.importc.}: float 
    QUARTER_PI* {.importc.}: float 
    TAU* {.importc.}: float 
    TWO_PI* {.importc.}: float 
    DEGREES* {.importc.}: any 
    RADIANS* {.importc.}: any 
    DEG_TO_RAD* {.importc.}: float 
    RAD_TO_DEG* {.importc.}: float 
    CORNER* {.importc.}: any 
    CORNERS* {.importc.}: any 
    RADIUS* {.importc.}: any 
    RIGHT* {.importc.}: any 
    LEFT* {.importc.}: any 
    CENTER* {.importc.}: any 
    TOP* {.importc.}: any 
    BOTTOM* {.importc.}: any 
    BASELINE* {.importc.}: any 
    POINTS* {.importc.}: float 
    LINES* {.importc.}: float 
    LINE_STRIP* {.importc.}: float 
    LINE_LOOP* {.importc.}: float 
    TRIANGLES* {.importc.}: float 
    TRIANGLE_FAN* {.importc.}: float 
    TRIANGLE_STRIP* {.importc.}: float 
    QUADS* {.importc.}: any 
    QUAD_STRIP* {.importc.}: any 
    CLOSE* {.importc.}: any 
    OPEN* {.importc.}: any 
    CHORD* {.importc.}: any 
    PIE* {.importc.}: any 
    PROJECT* {.importc.}: any 
    SQUARE* {.importc.}: any 
    ROUND* {.importc.}: any 
    BEVEL* {.importc.}: any 
    MITER* {.importc.}: any 
    RGB* {.importc.}: any 
    HSB* {.importc.}: any 
    HSL* {.importc.}: any 
    AUTO* {.importc.}: any 
    ALT* {.importc.}: any 
    BACKSPACE* {.importc.}: any 
    CONTROL* {.importc.}: any 
    DELETE* {.importc.}: any 
    DOWN_ARROW* {.importc.}: any 
    ENTER* {.importc.}: any 
    ESCAPE* {.importc.}: any 
    LEFT_ARROW* {.importc.}: any 
    OPTION* {.importc.}: any 
    RETURN* {.importc.}: any 
    RIGHT_ARROW* {.importc.}: any 
    SHIFT* {.importc.}: any 
    TAB* {.importc.}: any 
    UP_ARROW* {.importc.}: any 
    BLEND* {.importc.}: any 
    ADD* {.importc.}: any 
    DARKEST* {.importc.}: any 
    LIGHTEST* {.importc.}: any 
    DIFFERENCE* {.importc.}: any 
    EXCLUSION* {.importc.}: any 
    MULTIPLY* {.importc.}: any 
    SCREEN* {.importc.}: any 
    REPLACE* {.importc.}: any 
    OVERLAY* {.importc.}: any 
    HARD_LIGHT* {.importc.}: any 
    SOFT_LIGHT* {.importc.}: any 
    DODGE* {.importc.}: any 
    BURN* {.importc.}: any 
    THRESHOLD* {.importc.}: any 
    GRAY* {.importc.}: any 
    OPAQUE* {.importc.}: any 
    INVERT* {.importc.}: any 
    POSTERIZE* {.importc.}: any 
    DILATE* {.importc.}: any 
    ERODE* {.importc.}: any 
    BLUR* {.importc.}: any 
    NORMAL* {.importc.}: any 
    ITALIC* {.importc.}: any 
    BOLD* {.importc.}: any 
    LINEAR* {.importc.}: any 
    QUADRATIC* {.importc.}: any 
    BEZIER* {.importc.}: any 
    CURVE* {.importc.}: any 
    STROKE* {.importc.}: any 
    FILL* {.importc.}: any 
    TEXTURE* {.importc.}: any 
    IMMEDIATE* {.importc.}: any 
    LANDSCAPE* {.importc.}: any 
    PORTRAIT* {.importc.}: any 

#Elements

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
proc blend*(image: Image, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
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
proc saveFrames*(filename, extension: cstring, duration, framerate: PNumber, callback: proc(framesObj: openArray[JsObject]): void)

{.pop.}

var
    pixels* {.importc.}: seq[float]

{.push importc.}

proc blend*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
proc blend*(sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: any)
proc copy*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc copy*(sx, sy, sw, sh, dx, dy, dw, dh: int)
proc filter*(filterType: any)
proc filter*(filterType: any, filterParam: PNumber)
proc get*(): Image
proc get*(x, y: PNumber): openArray[float]
proc get*(x, y, w, h: PNumber): Image
proc loadPixels*()
proc set*(x, y: PNumber, value: PNumber | openArray[PNumber] | Color | Image)
proc updatePixels*()
proc updatePixels*(x, y, w, h: PNumber)
proc loadImage*(path: cstring): Image
proc loadImage*(path: cstring, successCallback: proc(img: Image)): Image
proc loadImage*(path: cstring, successCallback: proc(img: Image), failureCallback: proc(#[ TODO: Event ]#)): Image
proc image*(img: Image | Element, x, y: PNumber)
proc image*(img: Image | Element, x, y, w, h: PNumber)
proc image*(img: Image | Element, dx, dy, dw, dh, sx, sy: PNumber)
proc image*(img: Image | Element, dx, dy, dw, dh, sx, sy, sw, sh: PNumber)
proc tint*(v1, v2, v3: PNumber)
proc tint*(v1, v2, v3, alpha: PNumber)
proc tint*(value: cstring)
proc tint*(value: cstring, alpha: PNumber)
proc tint*(values: openArray[PNumber])
proc tint*(color: Color)
proc noTint*()
proc imageMode*(mode: any)

{.pop.}

#Vectors

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

{.pop.}

{.push importc.}

proc red*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc red*(color: cstring): float
proc blue*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc blue*(color: cstring): float
proc green*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc green*(color: cstring): float
proc alpha*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc alpha*(color: cstring): float
proc hue*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc hue*(color: cstring): float
proc saturation*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc saturation*(color: cstring): float
proc lightness*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc lightness*(color: cstring): float
proc brigthness*(color: Color | array[4, PNumber] | array[3, PNumber]): float
proc brigthness*(color: cstring): float

{.pop.}

#Graphics

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

var displayWidth* {.importc.}: float
var displayHeight* {.importc.}: float
var windowWidth* {.importc.}: float
var windowHeight* {.importc.}: float
var width* {.importc.}: float
var height* {.importc.}: float
var frameCount* {.importc.}: int
var focused*{.importc.}: bool

#Settings
{.push importc.}

proc cursor*(imgagePath: cstring)
proc cursor*(constant: any)
proc frameRate*(fps: PNumber)
proc frameRate*(): float
proc noCursor*()
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
proc random*[T](arr: openArray[T]): T
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
proc textBounds*(font: Font, line: cstring, x, y: PNumber): JsObject
proc textBounds*(font: Font, line: cstring, x, y: PNumber, fontSize: PNumber): JsObject
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

proc camera*()
proc camera*(x, y, z, centerX, centerY, centerZ, upX, upY, upZ: PNumber)
proc perspective*()
proc perspective*(fovy, aspect, near, far: PNumber)
proc ortho*(left, right, bottom, top, near, far: PNumber)

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

#WEBGL

proc newGeometry*(vertData: proc | JsObject): Geometry {.importcpp: "new p5.Geometry(@)"}
proc newGeometry*(vertData: proc | JsObject, detailX, detailY: PNumber): Geometry {.importcpp: "new p5.Geometry(@)"}
proc newGeometry*(vertData: proc | JsObject, detailX, detailY: PNumber, callback: proc): Geometry {.importcpp: "new p5.Geometry(@)"}

{.push importcpp.}

proc computeFaces*()
proc computeNormals*()
proc averageNormals*()
proc averagePoleNormals*()
proc normalize*()

{.pop.}

{.push importc.}

proc loadModel*(path: cstring): Geometry
proc loadModel*(path: cstring, normalize: bool): Geometry
proc loadModel*(path: cstring, normalize: bool, successCallback, failureCallback: proc): Geometry
proc loadModel*(path: cstring, successCallback, failureCallback: proc): Geometry
proc model*(model: Geometry)

{.pop.}

{.push importc.}

proc setUniform*(uniformName: cstring, data: JsObject | PNumber | bool | openArray[PNumber])
proc loadShader*(vertFileName, fragFileName: cstring): Shader
proc createShader*(vertCode, fragCode: cstring): Shader
proc shader*(shader: Shader)
proc normalMaterial*()
proc texture*(tex: Image | Graphics #[TODO: MediaElement]#)
proc ambientMaterial*(gray: PNumber)
proc ambientMaterial*(red, green, blue: PNumber)
proc ambientMaterial*(red, green, blue, alpha: PNumber)
proc ambientMaterial*(color: openArray[PNumber] | cstring | Color)
proc specularMaterial*(gray: PNumber)
proc specularMaterial*(red, green, blue: PNumber)
proc specularMaterial*(red, green, blue, alpha: PNumber)
proc specularMaterial*(color: openArray[PNumber] | cstring | Color)


{.pop.}

{.push importc.}

proc plane*()
proc plane*(width: PNumber)
proc plane*(width, height: PNumber)
proc plane*(width, height: PNumber, detailX: int)
proc plane*(width, height: PNumber, detailX, detailY: int)
proc box*()
proc box*(width: PNumber)
proc box*(width, height: PNumber)
proc box*(width, height, depth: PNumber)
proc box*(width, height: PNumber, detailX: int)
proc box*(width, height: PNumber, detailX, detailY: int)
proc sphere*()
proc sphere*(radius: PNumber)
proc sphere*(radius: PNumber, detailX: int)
proc sphere*(radius: PNumber, detailX, detailY: int)
proc cylinder*()
proc cylinder*(radius: PNumber)
proc cylinder*(radius, height: PNumber)
proc cylinder*(radius, height: PNumber, detailX: int)
proc cylinder*(radius, height: PNumber, detailX, detailY: int)
proc cone*()
proc cone*(radius: PNumber)
proc cone*(radius, height: PNumber)
proc cone*(radius, height: PNumber, detailX: int)
proc cone*(radius, height: PNumber, detailX, detailY: int)
proc ellipsoid*()
proc ellipsoid*(radiusX: PNumber)
proc ellipsoid*(radiusX, radiusY: PNumber)
proc ellipsoid*(radiusX, radiusY, radiusZ: PNumber)
proc ellipsoid*(radiusX, radiusY, radiusZ: PNumber, detailX: int)
proc ellipsoid*(radiusX, radiusY, radiusZ: PNumber, detailX, detailY: int)
proc torus*()
proc torus*(radius: PNumber)
proc torus*(radius, tubeRadius: PNumber)
proc torus*(radius, tubeRadius: PNumber, detailX: int)
proc torus*(radius, tubeRadius: PNumber, detailX, detailY: int)

#TODO: Investigate 2D primitives in WEBGL context (RendererGL)
{.pop.}

#XML

{.push importcpp.}

proc getParent*(self: XML): XML
proc getName*(self: XML): cstring
proc setName*(self: XML, name: cstring): void
proc hasChildren*(self: XML): bool
proc listChildren*(self: XML): seq[cstring]
proc getChildren*(self: XML): seq[XML]
proc getChildren*(self: XML, name: cstring): seq[XML]
proc getChild*(self: XML, nameOrIdx: cstring | PNumber): XML
proc addChild*(self: XML, a: XML): void
proc removeChild*(self: XML, nameOrIdx: cstring | PNumber): void
proc getAttributeCount*(self: XML): int
proc listAttributes*(self: XML): seq[cstring]
proc hasAttribute*(self: XML, attribute: cstring): bool
proc getNum*(self: XML, name: cstring): float
proc getNum*(self: XML, name: cstring, defaultValue: PNumber): float
proc getString*(self: XML, name: cstring): float
proc getString*(self: XML, name: cstring, defaultValue: PNumber): float
proc setAttribute*(self: XML, name: cstring, value: PNumber): void
proc getContent*(self: XML): cstring
proc getContent*(self: XML, defaultValue: cstring): cstring
proc setContent*(self: XML, content: cstring): void

{.pop.}

{.push importc.}

proc abs*(value: PNumber): PNumber
proc ceil*(value: PNumber): int
proc constrain*(n, min, max: PNumber): PNumber
proc dist*(x1, y1, x2, y2: PNumber): PNumber
proc exp*(n: PNumber): PNumber
proc floor*(n: PNumber): int
proc lerp*(start, stop, amt: PNumber): PNumber
proc log*(n: PNumber): PNumber
proc mag*(a, b: PNumber): PNumber
proc map*(value, start1, stop1, start2, stop2: PNumber): PNumber
proc map*(value, start1, stop1, start2, stop2: PNumber, withinBounds: bool): PNumber
proc max*(n0, n1: PNumber): PNumber
proc max*(nums: openArray[PNumber]): PNumber
proc min*(n0, n1: PNumber): PNumber
proc min*(nums: openArray[PNumber]): PNumber
proc norm*(value, start, stop: PNumber): PNumber
proc pow*(n, e: PNumber): PNumber
proc round*(n: PNumber): int
proc sq*(n: PNumber): PNumber
proc sqrt*(n: PNumber): PNumber

{.pop.}


proc orbitControl*() {.importc.}



























