import math

const
    P2D*:           cstring = "p2d"
    WEBGL*:         cstring = "webgl"
    ARROW*:         cstring = "default"
    CROSS*:         cstring = "crosshair"
    HAND*:          cstring = "pointer"
    MOVE*:          cstring = "move"
    TEXT*:          cstring = "text"
    WAIT*:          cstring = "wait"
    PI*:            float   = PI
    HALF_PI*:       float   = PI * 0.5
    QUARTER_PI*:    float   = HALF_PI * 0.5
    TAU*:           float   = PI * 2.0
    TWO_PI*:        float   = PI * 2.0
    DEGREES*:       cstring = "degrees"
    RADIANS*:       cstring = "radians"
    DEG_TO_RAD*:    float   = PI / 180.0
    RAD_TO_DEG*:    float   = 180.0 / PI
    CORNER*:        cstring = "corner"
    CORNERS*:       cstring = "corners"
    RADIUS*:        cstring = "radius"
    RIGHT*:         cstring = "right"
    LEFT*:          cstring = "left"
    CENTER*:        cstring = "center"
    TOP*:           cstring = "top"
    BOTTOM*:        cstring = "bottom"
    BASELINE*:      cstring = "alphabetic"
    POINTS*:        float   = 0x0000
    LINES*:         float   = 0x0001
    LINE_STRIP*:    float   = 0x0003
    LINE_LOOP*:     float   = 0x0002
    TRIANGLES*:     float   = 0x0004
    TRIANGLE_FAN*:  float   = 0x0006
    TRIANGLE_STRIP*:float   = 0x0005
    QUADS*:         cstring = "quads"
    QUAD_STRIP*:    cstring = "quad_strip"
    CLOSE*:         cstring = "close"
    OPEN*:          cstring = "open"
    CHORD*:         cstring = "chord"
    PIE*:           cstring = "pie"
    PROJECT*:       cstring = "square"
    SQUARE*:        cstring = "butt"
    ROUND*:         cstring = "round"
    BEVEL*:         cstring = "bevel"
    MITER*:         cstring = "miter"
    RGB*:           cstring = "rgb"
    HSB*:           cstring = "hsb"
    HSL*:           cstring = "hsl"
    AUTO*:          cstring = "auto"
    #inputs
    ALT*:           float   = 18
    BACKSPACE*:     float   = 8
    CONTROL*:       float   = 17
    DELETE*:        float   = 46
    DOWN_ARROW*:    float   = 40
    ENTER*:         float   = 13
    ESCAPE*:        float   = 27
    LEFT_ARROW*:    float   = 37
    OPTION*:        float   = 18
    RETURN*:        float   = 13
    RIGHT_ARROW*:   float   = 39
    SHIFT*:         float   = 16
    TAB*:           float   = 9
    UP_ARROW*:      float   = 38
    #rendering
    BLEND*:         cstring = "source-over"
    ADD*:           cstring = "lighter"
    DARKEST*:       cstring = "darken"
    LIGHTEST*:      cstring = "lighten"
    DIFFERENCE*:    cstring = "difference"
    EXCLUSION*:     cstring = "exclusion"
    MULTIPLY*:      cstring = "multiply"
    SCREEN*:        cstring = "screen"
    REPLACE*:       cstring = "copy"
    OVERLAY*:       cstring = "overlay"
    HARD_LIGHT*:    cstring = "hard-light"
    SOFT_LIGHT*:    cstring = "soft-light"
    DODGE*:         cstring = "color-dodge"
    BURN*:          cstring = "color-burn"
    THRESHOLD*:     cstring = "threshold"
    GRAY*:          cstring = "gray"
    OPAQUE*:        cstring = "opaque"
    INVERT*:        cstring = "invert"
    POSTERIZE*:     cstring = "posterize"
    DILATE*:        cstring = "dilate"
    ERODE*:         cstring = "erode"
    BLUR*:          cstring = "blur"
    #typography
    NORMAL*:        cstring = "normal"
    ITALIC*:        cstring = "italic"
    BOLD*:          cstring = "bold"
    #vertices
    LINEAR*:        cstring = "linear"
    QUADRATIC*:     cstring = "quadratic"
    BEZIER*:        cstring = "bezier"
    CURVE*:         cstring = "curve"
    #webgl
    STROKE*:        cstring = "stroke"
    FILL*:          cstring = "fill"
    TEXTURE*:       cstring = "texture"
    IMMEDIATE*:     cstring = "immediate"
    #device orientation
    LANDSCAPE*:     cstring = "landscape"
    PORTRAIT*:      cstring = "portrait"

type
    Color* = ref ColorObj
    ColorObj {.importc.} = object
        toString*: proc(): cstring
        setRed*: proc(value: float)
        setGreen*: proc(value: float)
        setBlue*: proc(value: float)
        setAlpha*: proc(value: float)

proc color*(channel1, channel2, channel3: float): Color {.importc.}
proc color*(channel1, channel2, channel3, alpha: float): Color {.importc.}
proc color*(gray: float): Color {.importc.}
proc color*(gray, alpha: float): Color {.importc.}
proc color*(str: cstring): Color {.importc.}
proc red*(color: Color): float {.importc.}
proc blue*(color: Color): float {.importc.}
proc green*(color: Color): float {.importc.}
proc alpha*(color: Color): float {.importc.}
proc hue*(color: Color): float {.importc.}
proc saturation*(color: Color): float {.importc.}
proc lightness*(color: Color): float {.importc.}
proc brigthness*(color: Color): float {.importc.}
proc lerpColor*(color1, color2: Color, amount: float): Color {.importc.}

type
    Image* = ref ImageObj
    ImageObj {.importc.} = object

proc createCanvas*(width, height: float) {.importc.}

proc background*(channel1, channel2, channel3: float) {.importc.}
proc background*(channel1, channel2, channel3, alpha: float) {.importc.}
proc background*(gray: float) {.importc.}
proc background*(gray, alpha: float) {.importc.}
proc background*(str: cstring) {.importc.}
proc background*(color: Color) {.importc.}
proc background*(image: Image) {.importc.}
proc clear*() {.importc.}
proc colorMode*(mode: cstring, value: float) {.importc.}
#proc colorMode*(mode: cstring, values: varargs[float]) #{.importc.} TODO: investigate varargs
proc fill*(channel1, channel2, channel3: float) {.importc.}
proc fill*(channel1, channel2, channel3: float, alpha: float) {.importc.}
proc fill*(gray: float) {.importc.}
proc fill*(gray: float, alpha: float) {.importc.}
proc fill*(str: cstring) {.importc.}
proc fill*(str: cstring, alpha: float) {.importc.}
proc fill*(color: Color) {.importc.}
proc fill*(color: Color, alpha: float) {.importc.}
proc noFill*() {.importc.}
proc noStroke*() {.importc.}
proc stroke*(channel1, channel2, channel3: float) {.importc.}
proc stroke*(channel1, channel2, channel3: float, alpha: float) {.importc.}
proc stroke*(gray: float) {.importc.}
proc stroke*(gray: float, alpha: float) {.importc.}
proc stroke*(str: cstring) {.importc.}
proc stroke*(str: cstring, alpha: float) {.importc.}
proc stroke*(color: Color) {.importc.}
proc stroke*(color: Color, alpha: float) {.importc.}

proc arc*(x, y, width, height, start, stop: float) {.importc.}
proc arc*(x, y, width, height, start, stop: float, mode: cstring) {.importc.}
proc ellipse*(x, y, diameter: float) {.importc.}
proc ellipse*(x, y, width, height: float) {.importc.}
proc line*(x1, y1, x2, y2: float) {.importc.}
proc point*(x, y: float) {.importc.}
proc quad*(x1, y1, x2, y2, x3, y3, x4, y4: float) {.importc.}
proc rect*(x, y, width, height: float) {.importc.}
proc rect*(x, y, width, height, tl, tr, bl, br: float) {.importc.} #TODO: How does this work in p5?
proc rect*(x, y, width, height, detailX, detailY: float) {.importc.}
proc triangle*(x1, y1, x2, y2, x3, y3: float) {.importc.}

proc ellipseMode*(mode: cstring) {.importc.}
proc noSmooth*() {.importc.}
proc rectMode*(mode: cstring) {.importc.}
proc smooth*() {.importc.}
proc strokeCap*(mode: cstring) {.importc.}
proc strokeJoin*(mode: cstring) {.importc.}
proc strokeWeight*(weight: float) {.importc.}

proc bezier*(x1, y1, x2, y2, x3, y3, x4, y4: float) {.importc.}
proc bezier*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: float) {.importc.}
proc bezierDetail*(detail: float) {.importc.}
proc bezierPoint*(a, b, c, d, t: float): float {.importc.}
proc bezierTangent*(a, b, c, d, t: float): float {.importc.}
proc curve*(x1, y1, x2, y2, x3, y3, x4, y4: float) {.importc.}
proc curve*(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: float) {.importc.}
proc curveDetail*(detail: float) {.importc.}
proc curveTightness*(tightness: float) {.importc.}
proc curvePoint*(a, b, c, d, t: float): float {.importc.}
proc curveTangent*(a, b, c, d, t: float): float {.importc.}

proc print*(content: untyped) {.importc.}
var frameCount* {.importc.}: int
var focused* {.importc.}: bool
proc cursor*(cursor: cstring) {.importc.}