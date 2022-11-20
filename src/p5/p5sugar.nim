template setup*(body: untyped) {.dirty.} =
  proc setup {.exportc.} =
    body

template draw*(body: untyped) {.dirty.} =
  proc draw {.exportc.} =
    body

template keyPressed*(body: untyped) {.dirty.} =
  proc keyPressed {.exportc.} =
    body

template preload*(body: untyped) {.dirty.} =
  proc preload {.exportc.} =
    body

template remove*(body: untyped) {.dirty.} =
  proc remove {.exportc.} =
    body

template preload*(body: untyped) {.dirty.} =
  proc preload {.exportc.} =
    body

template mouseMoved*(body: untyped) {.dirty.} =
  proc mouseMoved {.exportc.} =
    body

template mouseDragged*(body: untyped) {.dirty.} =
  proc mouseDragged {.exportc.} =
    body

template mousePressed*(body: untyped) {.dirty.} =
  proc mousePressed {.exportc.} =
    body

template mouseReleased*(body: untyped) {.dirty.} =
  proc mouseReleased {.exportc.} =
    body

template mouseClicked*(body: untyped) {.dirty.} =
  proc mouseClicked {.exportc.} =
    body

template doubleClicked*(body: untyped) {.dirty.} =
  proc doubleClicked {.exportc.} =
    body

template mouseWheel*(body: untyped) {.dirty.} =
  proc mouseWheel {.exportc.} =
    body

template keyPressed*(body: untyped) {.dirty.} =
  proc keyPressed {.exportc.} =
    body

template keyReleased*(body: untyped) {.dirty.} =
  proc keyReleased {.exportc.} =
    body

template keyTyped*(body: untyped) {.dirty.} =
  proc keyTyped {.exportc.} =
    body

template touchStarted*(body: untyped) {.dirty.} =
  proc touchStarted {.exportc.} =
    body

template touchMoved*(body: untyped) {.dirty.} =
  proc touchMoved {.exportc.} =
    body

template touchEnded*(body: untyped) {.dirty.} =
  proc touchEnded {.exportc.} =
    body

template deviceMoved*(body: untyped) {.dirty.} =
  proc deviceMoved {.exportc.} =
    body

template deviceTurned*(body: untyped) {.dirty.} =
  proc deviceTurned {.exportc.} =
    body

template deviceShaken*(body: untyped) {.dirty.} =
  proc deviceShaken {.exportc.} =
    body
