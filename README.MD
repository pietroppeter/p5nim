# Nim bindings for the p5.js library

p5 is a Javascript library used by artists, designers and programmers alike to quickly and easily express ideas, sketch concepts, make games and create interactive applications.

## Installing

### METHOD 1 (Preferred for end usage)

Make sure the nimble package manager is installed on your machine and in your PATH. Then run:
    
    nimble install nimp5
    
From now on, just **import p5** in any .nim file where you want to use the library.

### METHOD 2 (Preferred for contributing)
Clone the repository with:

    git clone https://github.com/Foldover/nim-p5/
  
somewhere on your computer.
  
## Basic usage

    import p5
    
    proc newColor(): Color =
      let
        r = random() * 255
        g = random() * 255
        b = random() * 255
        
      result = color(r, g, b)
    
    proc setup() {.exportc.} =
      createCanvas(500, 500)
      frameRate(3)
      
    proc draw() {.exportc.} =
      background(newColor())
      
As you see from the code above, using nimp5 is almost identical to using p5.js, save for the syntax. Just remember that all the procedures that p5 needs to know about have to be declared with the {.exportc.} pragma. There is a list of all such procedures in the p5.nim source file.
