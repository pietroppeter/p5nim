# see https://github.com/processing/p5.js-sound/blob/main/src/soundfile.js
# and https://p5js.org/reference/#/p5.SoundFile
type SoundFile* = ref object

{. push importc .}

proc loadSound*(path: cstring): SoundFile

{. pop .}

{. push importcpp .}

proc play*(soundFile: SoundFile)
proc stop*(soundFile: SoundFile)
proc isPlaying*(soundFile: SoundFile): bool

{. pop .}