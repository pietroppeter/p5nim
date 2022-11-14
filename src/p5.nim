import jsffi
import math
import dom

type PNumber* = int or float

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

    Geometry = ref object

    Shader* = ref object

    XML* = ref object

    PrintWriter* = ref object

    Table* = ref object

    Blob* = ref object

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
    mouseButton* {.importc.}: cstring
    mouseIsPressed* {.importc.}: bool

var
    keyIsPressed* {.importc.}: bool
    key* {.importc.}: cstring
    keyCode* {.importc.}: int

proc keyIsDown*(code: PNumber): bool {.importc.}

var
    touches* {.importc.}: seq[float]

var
    deviceOrientation* {.importc.}: cstring
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
    P2D* {.importc.}: cstring 
    WEBGL* {.importc.}: cstring
    ARROW* {.importc.}: cstring 
    CROSS* {.importc.}: cstring 
    HAND* {.importc.}: cstring 
    MOVE* {.importc.}: cstring 
    TEXT* {.importc.}: cstring 
    WAIT* {.importc.}: cstring 
    PI* {.importc.}: float 
    HALF_PI* {.importc.}: float 
    QUARTER_PI* {.importc.}: float 
    TAU* {.importc.}: float 
    TWO_PI* {.importc.}: float 
    DEGREES* {.importc.}: cstring 
    RADIANS* {.importc.}: cstring 
    DEG_TO_RAD* {.importc.}: float 
    RAD_TO_DEG* {.importc.}: float 
    CORNER* {.importc.}: cstring 
    CORNERS* {.importc.}: cstring 
    RADIUS* {.importc.}: cstring 
    RIGHT* {.importc.}: cstring 
    LEFT* {.importc.}: cstring 
    CENTER* {.importc.}: cstring 
    TOP* {.importc.}: cstring 
    BOTTOM* {.importc.}: cstring 
    BASELINE* {.importc.}: cstring 
    POINTS* {.importc.}: float 
    LINES* {.importc.}: float 
    LINE_STRIP* {.importc.}: float 
    LINE_LOOP* {.importc.}: float 
    TRIANGLES* {.importc.}: float 
    TRIANGLE_FAN* {.importc.}: float 
    TRIANGLE_STRIP* {.importc.}: float 
    QUADS* {.importc.}: cstring 
    QUAD_STRIP* {.importc.}: cstring 
    CLOSE* {.importc.}: cstring 
    OPEN* {.importc.}: cstring 
    CHORD* {.importc.}: cstring 
    PIE* {.importc.}: cstring 
    PROJECT* {.importc.}: cstring 
    SQUARE* {.importc.}: cstring
    ROUND* {.importc.}: cstring
    BEVEL* {.importc.}: cstring
    MITER* {.importc.}: cstring
    RGB* {.importc.}: cstring
    HSB* {.importc.}: cstring
    HSL* {.importc.}: cstring
    AUTO* {.importc.}: cstring
    ALT* {.importc.}: cstring
    BACKSPACE* {.importc.}: cstring
    CONTROL* {.importc.}: cstring
    DELETE* {.importc.}: cstring
    DOWN_ARROW* {.importc.}: cstring
    ENTER* {.importc.}: cstring
    ESCAPE* {.importc.}: cstring
    LEFT_ARROW* {.importc.}: cstring
    OPTION* {.importc.}: cstring
    RETURN* {.importc.}: cstring
    RIGHT_ARROW* {.importc.}: cstring
    SHIFT* {.importc.}: cstring
    TAB* {.importc.}: cstring
    UP_ARROW* {.importc.}: cstring
    BLEND* {.importc.}: cstring
    ADD* {.importc.}: cstring
    DARKEST* {.importc.}: cstring
    LIGHTEST* {.importc.}: cstring
    DIFFERENCE* {.importc.}: cstring
    EXCLUSION* {.importc.}: cstring
    MULTIPLY* {.importc.}: cstring
    SCREEN* {.importc.}: cstring
    REPLACE* {.importc.}: cstring
    OVERLAY* {.importc.}: cstring
    HARD_LIGHT* {.importc.}: cstring
    SOFT_LIGHT* {.importc.}: cstring
    DODGE* {.importc.}: cstring
    BURN* {.importc.}: cstring
    THRESHOLD* {.importc.}: cstring
    GRAY* {.importc.}: cstring
    OPAQUE* {.importc.}: cstring
    INVERT* {.importc.}: cstring
    POSTERIZE* {.importc.}: cstring
    DILATE* {.importc.}: cstring
    ERODE* {.importc.}: cstring
    BLUR* {.importc.}: cstring
    NORMAL* {.importc.}: cstring
    ITALIC* {.importc.}: cstring
    BOLD* {.importc.}: cstring
    LINEAR* {.importc.}: cstring
    QUADRATIC* {.importc.}: cstring
    BEZIER* {.importc.}: cstring
    CURVE* {.importc.}: cstring
    STROKE* {.importc.}: cstring
    FILL* {.importc.}: cstring
    TEXTURE* {.importc.}: cstring
    IMMEDIATE* {.importc.}: cstring
    LANDSCAPE* {.importc.}: cstring
    PORTRAIT* {.importc.}: cstring

#Elements

{.push importcpp.}

proc parent*(element: Element): Element
proc parent*(element: Element, newParent: cstring | Element | JsObject)
proc id*(element: Element): cstring
proc id*(element: Element, newId: cstring)
proc class*(element: Element): cstring
proc class*(element: Element, class: cstring)
proc mousePressed*(element: Element, arg: proc | bool)
proc doubleClicked*(element: Element, arg: proc | bool)
proc mouseWheel*(element: Element, arg: proc(event: JsObject) | bool)
proc mouseReleased*(element: Element, arg: proc | bool)
proc mouseClicked*(element: Element, arg: proc | bool)
proc mouseMoved*(element: Element, arg: proc | bool)
proc mouseOver*(element: Element, arg: proc | bool)
proc changed*(element: Element, arg: proc | bool)
proc input*(element: Element, arg: proc | bool)
proc mouseOut*(element: Element, arg: proc | bool)
proc touchStarted*(element: Element, arg: proc | bool)
proc touchMoved*(element: Element, arg: proc | bool)
proc touchEnded*(element: Element, arg: proc | bool)
proc dragOver*(element: Element, arg: proc | bool)
proc dragLeave*(element: Element, arg: proc | bool)
proc drop*(element: Element, callback: proc(file: File), fxn: proc)

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
proc filter*(image: Image, filterType: cstring)
proc filter*(image: Image, filterType: cstring, value: PNumber)
proc blend*(image: Image, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
proc blend*(image: Image, source: Image, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
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
{.push importcpp.}

proc createImage*(self: Graphics, w, h: int): Image
proc saveCanvas*(self: Graphics)
proc saveCanvas*(self: Graphics, selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#)
proc saveCanvas*(self: Graphics, selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#, filename: cstring)
proc saveCanvas*(self: Graphics, selectedCanvas: Element #[ TODO: | HTMLCanvasElement ]#, filename, extension: cstring)
proc saveCanvas*(self: Graphics, filename: cstring)
proc saveCanvas*(self: Graphics, filename, extension: cstring)
proc saveFrames*(self: Graphics, filename, extension: cstring, duration, framerate: PNumber)
proc saveFrames*(self: Graphics, filename, extension: cstring, duration, framerate: PNumber, callback: proc(framesObj: openArray[JsObject]): void)


{.pop.}

var
    pixels* {.importc.}: seq[float]

{.push importc.}

proc blend*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
proc blend*(sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
proc copy*(source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc copy*(sx, sy, sw, sh, dx, dy, dw, dh: int)
proc filter*(filterType: cstring)
proc filter*(filterType: cstring, filterParam: PNumber)
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
proc image*(img: Image | Element | Graphics, x, y: PNumber)
proc image*(img: Image | Element | Graphics, x, y, w, h: PNumber)
proc image*(img: Image | Element | Graphics, dx, dy, dw, dh, sx, sy: PNumber)
proc image*(img: Image | Element | Graphics, dx, dy, dw, dh, sx, sy, sw, sh: PNumber)
proc tint*(v1, v2, v3: PNumber)
proc tint*(v1, v2, v3, alpha: PNumber)
proc tint*(value: cstring)
proc tint*(value: cstring, alpha: PNumber)
proc tint*(values: openArray[PNumber])
proc tint*(color: Color)
proc noTint*()
proc imageMode*(mode: cstring)

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
proc createCanvas*(width, height: PNumber, renderMode: cstring)
proc resizeCanvas*(width, height: PNumber)
proc resizeCanvas*(width, height: PNumber, noRedraw: bool)
proc noCanvas*()
proc createGraphics*(width, height: PNumber): Graphics
proc createGraphics*(width, height: PNumber, renderMode: cstring): Graphics
proc blendMode*(mode: cstring)

proc noLoop*()
proc loop*()
proc push*()
proc pop*()
proc redraw*()
proc redraw*(n: int)

{.pop.}

{.push importcpp.}

proc blend*(graphics: Graphics, source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
proc blend*(graphics: Graphics, sx, sy, sw, sh, dx, dy, dw, dh: int, blendMode: cstring)
proc copy*(graphics: Graphics, source: Image | Element, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc copy*(graphics: Graphics, sx, sy, sw, sh, dx, dy, dw, dh: int)
proc filter*(graphics: Graphics, filterType: cstring)
proc filter*(graphics: Graphics, filterType: cstring, filterParam: PNumber)
proc get*(graphics: Graphics): Image
proc get*(graphics: Graphics, x, y: PNumber): openArray[float]
proc get*(graphics: Graphics, x, y, w, h: PNumber): Image
proc loadPixels*(graphics: Graphics)
proc set*(graphics: Graphics, x, y: PNumber, value: PNumber | openArray[PNumber] | Color | Image)
proc updatePixels*(graphics: Graphics)
proc updatePixels*(graphics: Graphics, x, y, w, h: PNumber)
proc loadImage*(graphics: Graphics, path: cstring): Image
proc loadImage*(graphics: Graphics, path: cstring, successCallback: proc(img: Image)): Image
proc loadImage*(graphics: Graphics, path: cstring, successCallback: proc(img: Image), failureCallback: proc(#[ TODO: Event ]#)): Image
proc image*(graphics: Graphics, img: Image | Element, x, y: PNumber)
proc image*(graphics: Graphics, img: Image | Element, x, y, w, h: PNumber)
proc image*(graphics: Graphics, img: Image | Element, dx, dy, dw, dh, sx, sy: PNumber)
proc image*(graphics: Graphics, img: Image | Element, dx, dy, dw, dh, sx, sy, sw, sh: PNumber)
proc tint*(graphics: Graphics, v1, v2, v3: PNumber)
proc tint*(graphics: Graphics, v1, v2, v3, alpha: PNumber)
proc tint*(graphics: Graphics, value: cstring)
proc tint*(graphics: Graphics, value: cstring, alpha: PNumber)
proc tint*(graphics: Graphics, values: openArray[PNumber])
proc tint*(graphics: Graphics, color: Color)
proc noTint*(graphics: Graphics)
proc imageMode*(graphics: Graphics, mode: cstring)
proc blendMode*(self: Graphics, mode: cstring)
proc background*(self: Graphics, channel1, channel2, channel3: PNumber)
proc background*(self: Graphics, channel1, channel2, channel3, alpha: PNumber)
proc background*(self: Graphics, gray: PNumber)
proc background*(self: Graphics, gray, alpha: PNumber)
proc background*(self: Graphics, str: cstring)
proc background*(self: Graphics, color: Color)
proc background*(self: Graphics, image: Image)
proc beginCountour*(self: Graphics)
proc beginShape*(self: Graphics)
proc beginShape*(self: Graphics, mode: cstring)
proc bezierVertex*(self: Graphics, x2, y2, x3, y3, x4, y4: PNumber)
proc curveVertex*(self: Graphics, x, y: PNumber)
proc endContour*(self: Graphics)
proc endShape*(self: Graphics, mode: cstring)
proc quadraticVertex*(self: Graphics, cx, cy, x3, y3: PNumber)
proc vertex*(self: Graphics, x, y: PNumber)
proc vertex*(self: Graphics, x, y, z, u, v: PNumber)
proc clear*(self: Graphics)
proc colorMode*(self: Graphics, mode: cstring)
proc colorMode*(self: Graphics, mode: cstring, max: PNumber)
proc colorMode*(self: Graphics, mode: cstring, max1, max2, max3: PNumber)
proc colorMode*(self: Graphics, mode: cstring, max1, max2, max3, maxAlpha: PNumber)
proc fill*(self: Graphics, channel1, channel2, channel3: PNumber)
proc fill*(self: Graphics, channel1, channel2, channel3: PNumber, alpha: PNumber)
proc fill*(self: Graphics, gray: PNumber)
proc fill*(self: Graphics, gray: PNumber, alpha: PNumber)
proc fill*(self: Graphics, str: cstring)
proc fill*(self: Graphics, str: cstring, alpha: PNumber)
proc fill*(self: Graphics, color: Color)
proc fill*(self: Graphics, color: Color, alpha: PNumber)
proc noFill*(self: Graphics)
proc noStroke*(self: Graphics)
proc stroke*(self: Graphics, channel1, channel2, channel3: PNumber)
proc stroke*(self: Graphics, channel1, channel2, channel3: PNumber, alpha: PNumber)
proc stroke*(self: Graphics, gray: PNumber)
proc stroke*(self: Graphics, gray: PNumber, alpha: PNumber)
proc stroke*(self: Graphics, str: cstring)
proc stroke*(self: Graphics, str: cstring, alpha: PNumber)
proc stroke*(self: Graphics, color: Color)
proc stroke*(self: Graphics, color: Color, alpha: PNumber)
proc arc*(self: Graphics, x, y, width, height, start, stop: PNumber)
proc arc*(self: Graphics, x, y, width, height, start, stop: PNumber, mode: cstring)
proc ellipse*(self: Graphics, x, y, diameter: PNumber)
proc ellipse*(self: Graphics, x, y, width, height: PNumber)
proc line*(self: Graphics, x1, y1, x2, y2: PNumber)
proc point*(self: Graphics, x, y: PNumber)
proc quad*(self: Graphics, x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc rect*(self: Graphics, x, y, width, height: PNumber)
proc rect*(self: Graphics, x, y, width, height, tl, tr, bl, br: PNumber)
proc rect*(self: Graphics, x, y, width, height, detailX, detailY: PNumber)
proc triangle*(self: Graphics, x1, y1, x2, y2, x3, y3: PNumber)
proc ellipseMode*(self: Graphics, mode: cstring)
proc noSmooth*(self: Graphics)
proc rectMode*(self: Graphics, mode: cstring)
proc smooth*(self: Graphics, )
proc strokeCap*(self: Graphics, mode: cstring)
proc strokeJoin*(self: Graphics, mode: cstring)
proc strokeWeight*(self: Graphics, weight: PNumber)
proc bezier*(self: Graphics, x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc bezier*(self: Graphics, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber)
proc bezierDetail*(self: Graphics, detail: PNumber)
proc bezierPoint*(self: Graphics, a, b, c, d, t: PNumber): PNumber
proc bezierTangent*(self: Graphics, a, b, c, d, t: PNumber): PNumber
proc curve*(self: Graphics, x1, y1, x2, y2, x3, y3, x4, y4: PNumber)
proc curve*(self: Graphics, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber)
proc curveDetail*(self: Graphics, detail: PNumber)
proc curveTightness*(self: Graphics, tightness: PNumber)
proc curvePoint*(self: Graphics, a, b, c, d, t: PNumber): PNumber
proc curveTangent*(self: Graphics, a, b, c, d, t: PNumber): PNumber
proc applyMatrix*(self: Graphics, a, b, c, d, e, f: PNumber)
proc popMatrix*(self: Graphics)
proc pushMatrix*(self: Graphics)
proc printMatrix*(self: Graphics)
proc resetMatrix*(self: Graphics)
proc rotate*(self: Graphics, angle: PNumber)
proc rotate*(self: Graphics, angle: PNumber, axis: array[3, PNumber] | Vector)
proc rotateX*(self: Graphics, radians: PNumber)
proc rotateY*(self: Graphics, radians: PNumber)
proc rotateZ*(self: Graphics, radians: PNumber)
proc scale*(self: Graphics, s: PNumber | Vector | array[3, PNumber])
proc scale*(self: Graphics, s: PNumber | Vector | array[3, PNumber], y: PNumber)
proc scale*(self: Graphics, s: PNumber | Vector | array[3, PNumber], z: PNumber)
proc scale*(self: Graphics, s: PNumber | Vector | array[3, PNumber], y, z: PNumber)
proc shearX*(self: Graphics, angle: PNumber)
proc shearY*(self: Graphics, angle: PNumber)
proc translate*(self: Graphics, x, y: PNumber)
proc translate*(self: Graphics, x, y, z: PNumber)
proc textAlign*(self: Graphics, horizAlign: cstring): float
proc textAlign*(self: Graphics, horizAlign, vertAlign: cstring): float
proc textLeading*(self: Graphics): float
proc textLeading*(self: Graphics, leading: PNumber)
proc textSize*(self: Graphics): float
proc textSize*(self: Graphics, size: PNumber)
proc textStyle*(self: Graphics): cstring
proc textStyle*(self: Graphics, style: cstring)
proc textWidth*(self: Graphics, text: cstring): float
proc textAscent*(self: Graphics): float
proc textDescent*(self: Graphics): float
proc text*(self: Graphics, text: cstring, x, y: PNumber)
proc text*(self: Graphics, text: cstring, x, y, x2, y2: PNumber)
proc camera*(self: Graphics)
proc camera*(self: Graphics, x, y, z, centerX, centerY, centerZ, upX, upY, upZ: PNumber)
proc perspective*(self: Graphics)
proc perspective*(self: Graphics, fovy, aspect, near, far: PNumber)
proc ortho*(self: Graphics, left, right, bottom, top, near, far: PNumber)
proc ambientLight*(self: Graphics, v1, v2, v3: PNumber)
proc ambientLight*(self: Graphics, v1, v2, v3, alpha: PNumber)
proc ambientLight*(self: Graphics, color: cstring)
proc ambientLight*(self: Graphics, color: cstring, alpha: PNumber)
proc ambientLight*(self: Graphics, value: openArray[PNumber])
proc ambientLight*(self: Graphics, color: Color)
proc directionalLight*(self: Graphics, v1, v2, v3: PNumber, position: Vector)
proc directionalLight*(self: Graphics, value: openArray[PNumber] | cstring | Color, x, y, z: PNumber)
proc directionalLight*(self: Graphics, value: openArray[PNumber] | cstring | Color, position: Vector)
proc directionalLight*(self: Graphics, v1, v2, v3, x, y, z: PNumber)
proc pointLight*(self: Graphics, v1, v2, v3, x, y, z: PNumber)
proc pointLight*(self: Graphics, v1, v2, v3, position: Vector)
proc pointLight*(self: Graphics, value: openArray[PNumber] | cstring | Color, x, y, z: PNumber)
proc pointLight*(self: Graphics, value: openArray[PNumber] | cstring | Color, position: Vector)
proc setUniform*(self: Graphics, uniformName: cstring, data: JsObject | PNumber | bool | openArray[PNumber])
proc loadShader*(self: Graphics, vertFileName, fragFileName: cstring): Shader
proc createShader*(self: Graphics, vertCode, fragCode: cstring): Shader
proc shader*(self: Graphics, shader: Shader)
proc normalMaterial*(self: Graphics)
proc texture*(self: Graphics, tex: Image | Graphics #[TODO: MediaElement]#)
proc ambientMaterial*(self: Graphics, gray: PNumber)
proc ambientMaterial*(self: Graphics, red, green, blue: PNumber)
proc ambientMaterial*(self: Graphics, red, green, blue, alpha: PNumber)
proc ambientMaterial*(self: Graphics, color: openArray[PNumber] | cstring | Color)
proc specularMaterial*(self: Graphics, gray: PNumber)
proc specularMaterial*(self: Graphics, red, green, blue: PNumber)
proc specularMaterial*(self: Graphics, red, green, blue, alpha: PNumber)
proc specularMaterial*(self: Graphics, color: openArray[PNumber] | cstring | Color)
proc plane*(self: Graphics)
proc plane*(self: Graphics, width: PNumber)
proc plane*(self: Graphics, width, height: PNumber)
proc plane*(self: Graphics, width, height: PNumber, detailX: int)
proc plane*(self: Graphics, width, height: PNumber, detailX, detailY: int)
proc box*(self: Graphics)
proc box*(self: Graphics, width: PNumber)
proc box*(self: Graphics, width, height: PNumber)
proc box*(self: Graphics, width, height, depth: PNumber)
proc box*(self: Graphics, width, height: PNumber, detailX: int)
proc box*(self: Graphics, width, height: PNumber, detailX, detailY: int)
proc sphere*(self: Graphics)
proc sphere*(self: Graphics, radius: PNumber)
proc sphere*(self: Graphics, radius: PNumber, detailX: int)
proc sphere*(self: Graphics, radius: PNumber, detailX, detailY: int)
proc cylinder*(self: Graphics)
proc cylinder*(self: Graphics, radius: PNumber)
proc cylinder*(self: Graphics, radius, height: PNumber)
proc cylinder*(self: Graphics, radius, height: PNumber, detailX: int)
proc cylinder*(self: Graphics, radius, height: PNumber, detailX, detailY: int)
proc cone*(self: Graphics)
proc cone*(self: Graphics, radius: PNumber)
proc cone*(self: Graphics, radius, height: PNumber)
proc cone*(self: Graphics, radius, height: PNumber, detailX: int)
proc cone*(self: Graphics, radius, height: PNumber, detailX, detailY: int)
proc ellipsoid*(self: Graphics)
proc ellipsoid*(self: Graphics, radiusX: PNumber)
proc ellipsoid*(self: Graphics, radiusX, radiusY: PNumber)
proc ellipsoid*(self: Graphics, radiusX, radiusY, radiusZ: PNumber)
proc ellipsoid*(self: Graphics, radiusX, radiusY, radiusZ: PNumber, detailX: int)
proc ellipsoid*(self: Graphics, radiusX, radiusY, radiusZ: PNumber, detailX, detailY: int)
proc torus*(self: Graphics)
proc torus*(self: Graphics, radius: PNumber)
proc torus*(self: Graphics, radius, tubeRadius: PNumber)
proc torus*(self: Graphics, radius, tubeRadius: PNumber, detailX: int)
proc torus*(self: Graphics, radius, tubeRadius: PNumber, detailX, detailY: int)

{.pop.}

#Vertex
{.push importc.}

proc beginCountour*()
proc beginShape*()
proc beginShape*(mode: cstring)
proc bezierVertex*(x2, y2, x3, y3, x4, y4: PNumber)
proc curveVertex*(x, y: PNumber)
proc endContour*()
proc endShape*(mode: cstring)
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
proc colorMode*(mode: cstring)
proc colorMode*(mode: cstring, max: PNumber)
proc colorMode*(mode: cstring, max1, max2, max3: PNumber)
proc colorMode*(mode: cstring, max1, max2, max3, maxAlpha: PNumber)
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
proc print*(content: cstring) {.importc.}

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
proc cursor*(constant: cstring)
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
proc angleMode*(mode: cstring)

{.pop.}

#Typography

{.push importc.}

proc textAlign*(horizAlign: cstring): float
proc textAlign*(horizAlign, vertAlign: cstring): float
proc textLeading*(): float
proc textLeading*(leading: PNumber)
proc textSize*(): float
proc textSize*(size: PNumber)
proc textStyle*(): cstring
proc textStyle*(style: cstring)
proc textWidth*(text: cstring): float
proc textAscent*(): float
proc textDescent*(): float
proc loadFont*(path: cstring): Font
proc loadFont*(path: cstring, callback: proc): Font
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

proc noise*(x: PNumber): float
proc noise*(x, y: PNumber): float
proc noise*(x, y, z: PNumber): float
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

{.push importc.}

proc loadJSON*(path: string): JsObject {.varargs.}
proc loadStrings*(filename: string): seq[string]
proc loadStrings*(filename: string, callback: proc): seq[string]
proc loadStrings*(filename: string, callback, errorCallback: proc): seq[string]
proc loadTable*(filename: string): JsObject
proc loadTable*(filaneame: string, callback: proc): JsObject
proc loadTable*(filaneame: string, callback, errorCallback: proc): JsObject
proc loadTable*(filename, options: string): JsObject
proc loadTable*(filaneame, options: string, callback: proc): JsObject
proc loadTable*(filaneame, options: string, callback, errorCallback: proc): JsObject
proc loadXML*(filename: string): JsObject
proc loadXML*(filename: string, callback: proc): JsObject
proc loadXML*(filename: string, callback, errorCallback: proc): JsObject
proc httpGet*(path: string)
proc httpGet*(path, datatype: string)
proc httpGet*(path, datatype: string, data: JsObject)
proc httpGet*(path, datatype: string, data: JsObject, callback: proc)
proc httpGet*(path, datatype: string, data: JsObject, callback, errorCallback: proc)
proc httpPost*(path: string)
proc httpPost*(path, datatype: string)
proc httpPost*(path, datatype: string, data: JsObject)
proc httpPost*(path, datatype: string, data: JsObject, callback: proc)
proc httpPost*(path, datatype: string, data: JsObject, callback, errorCallback: proc)
proc httpDo*(path: string)
proc httpDo*(path, reqMethod: string)
proc httpDo*(path, reqMethod, datatype: string)
proc httpDo*(path, reqMethod, datatype: string, data: JsObject)
proc httpDo*(path, reqMethod, datatype: string, data: JsObject, callback: proc)
proc httpDo*(path, reqMethod, datatype: string, data: JsObject, callback, errorCallback: proc)
proc httpDo*(path, options: string)
proc httpDo*(path, options: string, callback: proc)
proc httpDo*(path, options: string, callback, errorCallback: proc)
proc createWrite*(name: string): PrintWriter
proc createWrite*(name, extension: string): PrintWriter
proc save*()
proc save*(objectOrFilename: string | JsObject)
proc save*(objectOrFilename: string | JsObject, filename: string)
proc save*(objectOrFilename: string | JsObject, options: bool | string)
proc saveJSON*(json: seq[cstring] | JsObject, filename: string)
proc saveJSON*(json: seq[cstring] | JsObject, filename: string, optimize: bool)
proc saveStrings*(list: seq[string], filename: string)
proc saveStrings*(list: seq[string], filename, extension: string)
proc saveTable*(table: Table, filename: string)
proc saveTable*(table: Table, filename, options: string)
proc downloadFile*(data: string | Blob)
proc downloadFile*(data: string | Blob, filename: string)
proc downloadFile*(data: string | Blob, filename, extension: string)

{.pop.}

{.push importcpp.}

proc write*(self: PrintWriter, data: seq[JsObject] | seq[cstring])
proc print*(self: PrintWriter, data: seq[JsObject] | seq[cstring])
proc clear*(self: PrintWriter)
proc close*(self: PrintWriter)

{.pop.}
























