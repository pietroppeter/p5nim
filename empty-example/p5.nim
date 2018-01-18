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

type
    Image* = ref ImageObj
    ImageObj {.importc.} = object

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

proc addVectors*(vector1, vector2: Vector): Vector =
    result = createVector(0, 0, 0)
    result.add(vector1)
    result.add(vector2)

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


type
  Color* = ref ColorObj
  ColorObj {.importc.} = object

{.push importc.}

proc color*(channel1, channel2, channel3: PNumber): Color {.importc.}
proc color*(channel1, channel2, channel3, alpha: PNumber): Color {.importc.}
proc color*(gray: PNumber): Color {.importc.}
proc color*(gray, alpha: PNumber): Color {.importc.}
proc color*(str: cstring): Color {.importc.}
proc toString*(color: Color): cstring {.importcpp.}
proc setRed*(color: Color, value: PNumber) {.importcpp.}
proc setGreen*(color: Color, value: PNumber) {.importcpp.}
proc setBlue*(color: Color, value: PNumber) {.importcpp.}
proc setAlpha*(color: Color, value: PNumber) {.importcpp.}
proc red*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc red*(color: cstring): PNumber {.importc.}
proc blue*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc blue*(color: cstring): PNumber {.importc.}
proc green*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc green*(color: cstring): PNumber {.importc.}
proc alpha*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc alpha*(color: cstring): PNumber {.importc.}
proc hue*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc hue*(color: cstring): PNumber {.importc.}
proc saturation*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc saturation*(color: cstring): PNumber {.importc.}
proc lightness*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc lightness*(color: cstring): PNumber {.importc.}
proc brigthness*(color: Color | array[4, PNumber] | array[3, PNumber]): PNumber {.importc.}
proc brigthness*(color: cstring): PNumber {.importc.}
proc lerpColor*(color1, color2: Color, amount: PNumber): Color {.importc.}

{.pop.}

proc createCanvas*(width, height: PNumber) {.importc.}
proc createCanvas*(width, height: PNumber, renderMode: any) {.importc.}
proc resizeCanvas*(width, height: PNumber) {.importc.}
proc resizeCanvas*(width, height: PNumber, noRedraw: bool) {.importc.}
proc noCanvas*() {.importc.}
proc createGraphics*(width, height: PNumber): object {.importc.}
proc createGraphics*(width, height: PNumber, renderMode: any): object {.importc.}
proc blendMode*(mode: any) {.importc.}

proc noLoop*() {.importc.}
proc loop*() {.importc.}
proc push*() {.importc.}
proc pop*() {.importc.}
proc redraw*() {.importc.}
proc redraw*(n: int) {.importc.}

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

proc background*(channel1, channel2, channel3: PNumber) {.importc.}
proc background*(channel1, channel2, channel3, alpha: PNumber) {.importc.}
proc background*(gray: PNumber) {.importc.}
proc background*(gray, alpha: PNumber) {.importc.}
proc background*(str: cstring) {.importc.}
proc background*(color: Color) {.importc.}
proc background*(image: Image) {.importc.}
proc clear*() {.importc.}
proc colorMode*(mode: any) {.importc.}
proc colorMode*(mode: any, max: PNumber) {.importc.}
proc colorMode*(mode: any, max1, max2, max3: PNumber) {.importc.}
proc colorMode*(mode: any, max1, max2, max3, maxAlpha: PNumber) {.importc.}
proc fill*(channel1, channel2, channel3: PNumber) {.importc.}
proc fill*(channel1, channel2, channel3: PNumber, alpha: PNumber) {.importc.}
proc fill*(gray: PNumber) {.importc.}
proc fill*(gray: PNumber, alpha: PNumber) {.importc.}
proc fill*(str: cstring) {.importc.}
proc fill*(str: cstring, alpha: PNumber) {.importc.}
proc fill*(color: Color) {.importc.}
proc fill*(color: Color, alpha: PNumber) {.importc.}
proc noFill*() {.importc.}
proc noStroke*() {.importc.}
proc stroke*(channel1, channel2, channel3: PNumber) {.importc.}
proc stroke*(channel1, channel2, channel3: PNumber, alpha: PNumber) {.importc.}
proc stroke*(gray: PNumber) {.importc.}
proc stroke*(gray: PNumber, alpha: PNumber) {.importc.}
proc stroke*(str: cstring) {.importc.}
proc stroke*(str: cstring, alpha: PNumber) {.importc.}
proc stroke*(color: Color) {.importc.}
proc stroke*(color: Color, alpha: PNumber) {.importc.}

#2D Primitives

proc arc*(x, y, width, height, start, stop: PNumber) {.importc.}
proc arc*(x, y, width, height, start, stop: PNumber, mode: cstring) {.importc.}
proc ellipse*(x, y, diameter: PNumber) {.importc.}
proc ellipse*(x, y, width, height: PNumber) {.importc.}
proc line*(x1, y1, x2, y2: PNumber) {.importc.}
proc point*(x, y: PNumber) {.importc.}
proc quad*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber) {.importc.}
proc rect*(x, y, width, height: PNumber) {.importc.}
proc rect*(x, y, width, height, tl, tr, bl, br: PNumber) {.importc.} #TODO: How does this work in p5?
proc rect*(x, y, width, height, detailX, detailY: PNumber) {.importc.}
proc triangle*(x1, y1, x2, y2, x3, y3: PNumber) {.importc.}

#Rendering settings

proc ellipseMode*(mode: cstring) {.importc.}
proc noSmooth*() {.importc.}
proc rectMode*(mode: cstring) {.importc.}
proc smooth*() {.importc.}
proc strokeCap*(mode: cstring) {.importc.}
proc strokeJoin*(mode: cstring) {.importc.}
proc strokeWeight*(weight: PNumber) {.importc.}

#Curves

proc bezier*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber) {.importc.}
proc bezier*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber) {.importc.}
proc bezierDetail*(detail: PNumber) {.importc.}
proc bezierPoint*(a, b, c, d, t: PNumber): PNumber {.importc.}
proc bezierTangent*(a, b, c, d, t: PNumber): PNumber {.importc.}
proc curve*(x1, y1, x2, y2, x3, y3, x4, y4: PNumber) {.importc.}
proc curve*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: PNumber) {.importc.}
proc curveDetail*(detail: PNumber) {.importc.}
proc curveTightness*(tightness: PNumber) {.importc.}
proc curvePoint*(a, b, c, d, t: PNumber): PNumber {.importc.}
proc curveTangent*(a, b, c, d, t: PNumber): PNumber {.importc.}

#Settings

proc print*(content: untyped) {.importc.}
var frameCount* {.importc.}: int
var focused* {.importc.}: bool
proc cursor*(imgagePath: cstring) {.importc.}
proc cursor*(constant: any) {.importc.}
proc frameRate*(fps: PNumber) {.importc.}
proc frameRate*(): float {.importc.}
proc noCursor*() {.importc.}
var displayWidth* {.importc.}: float
var displayHeight* {.importc.}: float
var windowWidth* {.importc.}: float
var windowHeight* {.importc.}: float
var width* {.importc.}: float
var height* {.importc.}: float
proc fullscreen*(isFullScreen: bool) {.importc.}
proc fullscreen*(): bool {.importc.}
proc pixelDensity*(density: PNumber) {.importc.}
proc pixelDensity*(): float {.importc.}
proc displayDensity*(): float {.importc.}
proc getURL*(): cstring {.importc.}
proc getURLPath*(): openarray[cstring] {.importc.}
proc getURLParams*(): object {.importc.}

#Transforms

proc applyMatrix*(a, b, c, d, e, f: PNumber) {.importc.}
proc popMatrix*() {.importc.}
proc pushMatrix*() {.importc.}
proc printMatrix*() {.importc.}
proc resetMatrix*() {.importc.}
proc rotate*(angle: PNumber) {.importc.}
proc rotate*(angle: PNumber, axis: array[3, PNumber] | Vector) {.importc.}
proc rotateX*(radians: PNumber) {.importc.}
proc rotateY*(radians: PNumber) {.importc.}
proc rotateZ*(radians: PNumber) {.importc.}
proc scale*(s: PNumber | Vector | array[3, PNumber]) {.importc.}
proc scale*(s: PNumber | Vector | array[3, PNumber], y: PNumber) {.importc.}
proc scale*(s: PNumber | Vector | array[3, PNumber], z: PNumber) {.importc.}
proc scale*(s: PNumber | Vector | array[3, PNumber], y, z: PNumber) {.importc.}
proc shearX*(angle: PNumber) {.importc.}
proc shearY*(angle: PNumber) {.importc.}
proc translate*(x, y: PNumber) {.importc.}
proc translate*(x, y, z: PNumber) {.importc.}

#Random
{.push importc.}

proc randomSeed*(seed: PNumber)
proc random*(): float
proc random*(maximum: PNumber): float
proc random*(arr: openArray[float]): any
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
proc textBounds*(font: Font, line: cstring, x, y: PNumber, options: any): any
proc textBounds*(font: Font, line: cstring, x, y: PNumber, fontSize: PNumber, options: any): any
proc textToPoints*(font: Font, text: cstring, x, y: PNumber): openArray[any]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, fontSize: PNumber): openArray[any]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, options: any): openArray[any]
proc textToPoints*(font: Font, text: cstring, x, y: PNumber, fontSize: PNumber, options: any): openArray[any]

{.pop.}

