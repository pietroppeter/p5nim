import nimib, index, p5
nbInit
nbUseP5
nb.addEntry(7, "Okazz 221026a", """
Art by [Okazz](https://openprocessing.org/user/128718?view=sketches&o=31),
original at [openprocessing.org/sketch/1653811](https://openprocessing.org/sketch/1711659).
""")
nbText: """
License is [CreativeCommons Attribution NonCommercial ShareAlike](https://creativecommons.org/licenses/by-nc-sa/3.0/).

The original sketch has been ported from p5js to p5nim.
"""
# maybe this will be used to train an automatic translator
let sourceOriginalJs = """
let palettes = [
  ['#6b2d5c', '#f0386b', '#ff5376', '#e391db', '#f8c0c8'],
  ['#ffe957', '#eec170', '#f2a65a', '#f58549', '#ff6c3f'],
  ['#073b3a', '#0b6e4f', '#08a045', '#6bbf59', '#71deb2'],
  ['#c52233', '#a51c30', '#a7333f', '#74121d', '#580c1f'],
  ['#03045e', '#0077b6', '#00b4d8', '#90e0ef', '#caf0f8'],
  ['#f8f9fa', '#dee2e6', '#adb5bd', '#495057', '#212529']
];
let SEED = Math.floor(Math.random() * 1000000);
let forms = [];

function setup() {
  createCanvas(900, 900);
  rectMode(CENTER);
  // randomSeed(SEED)
  //   background(255);
  //   forms.push(new Form(width/2, height/2, 100));
  let seg = 25;
  let w = width / seg;
  for (let i = 0; i < seg; i++) {
    for (let j = 0; j < seg; j++) {
      let x = i * w + w / 2;
      let y = j * w + w / 2;
      forms.push(new Form(x, y, w));
    }
  }
}

function draw() {
  background(255);
  for (let f of forms) {
    f.show();
    f.move();
  }
  // this.x = x;

  // randomSeed(SEED)
  // 
}

function form(x, y, w) {
  // let num = int(random());
  let num = int(5);
  let d = dist(width / 2, height / 2, x, y);
  let c = int(map(d, 0, sqrt(sq(width / 2) + sq(height / 2)), 0, palettes.length * 2) + frameCount * 0.5);
  let colors = palettes[c % palettes.length];

  // shuffle(colors, true);
  for (let i = 0; i < num; i++) {
    let r = map(i, 0, num, 0, w / 2);
    let ww = map(i, 0, num, w, 0);
    let col = colors[i % colors.length];
    fill(col);
    rect(x, y, ww, ww, r);
  }
}

class Form {
  constructor(x, y, w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.palettes = [];
    for (let i = 0; i < palettes.length; i++) {
      let c = []
      shuffle(palettes[i], true);
      for (let j = 0; j < 5; j++) {
        c.push(palettes[i][j]);
      }
      this.palettes.push(c);
    }
    this.num = 5;
    this.colors = [];
  }

  show() {
    let d = dist(width / 2, height / 2, this.x, this.y);
    let c = int(map(d, sqrt(sq(width / 2) + sq(height / 2)), 0, 0, palettes.length) + frameCount * 0.02);
    this.colors = this.palettes[c % palettes.length];
    for (let i = 0; i < this.num; i++) {
      let r = map(i, 0, this.num, 0, this.w / 2);
      let ww = map(i, 0, this.num, this.w, 0);
      let col = this.colors[i % this.colors.length];
      fill(col);
      rect(this.x, this.y, ww, ww, r);
    }
  }

  move() {

  }

}
"""

nbJsFromCode:
  import std / [random, sequtils]
  import std / math except sqrt

  var palettes = @[
    @["#6b2d5c", "#f0386b", "#ff5376", "#e391db", "#f8c0c8"],
    @["#ffe957", "#eec170", "#f2a65a", "#f58549", "#ff6c3f"],
    @["#073b3a", "#0b6e4f", "#08a045", "#6bbf59", "#71deb2"],
    @["#c52233", "#a51c30", "#a7333f", "#74121d", "#580c1f"],
    @["#03045e", "#0077b6", "#00b4d8", "#90e0ef", "#caf0f8"],
    @["#f8f9fa", "#dee2e6", "#adb5bd", "#495057", "#212529"]
  ]
  let SEED = math.floor(random.rand(1.0) * 1000000) # using p5js.floor throws an error in console

  type
    Form = ref object
      x, y, w: float
      palettes: seq[seq[string]] 
      num: int
      colors: seq[string]

  var forms: seq[Form]

  proc newForm(x, y, w: float): Form =
    result = new Form
    result.x = x
    result.y = y
    result.w = w
    result.palettes = newSeqWith(0, newSeq[string]())
    for i in 0 ..< len(palettes):
      var c = palettes[i]
      shuffle(c)
      result.palettes.add(c)
    result.num = 5
    result.colors = newSeq[string]()

  proc show(form: Form) =
    let d = dist(width / 2, height / 2, form.x, form.y)
    let c = int(map(d, sqrt(sq(width / 2) + sq(height / 2)), 0, 0, palettes.len) + frameCount * 0.02)
    form.colors = form.palettes[c mod palettes.len]
    for i in 0 ..< form.num:
      let r = map(float(i), 0, form.num, 0, form.w / 2)
      let ww = map(float(i), 0, form.num, form.w, 0)
      let col = form.colors[i mod form.colors.len]
      fill(col)
      rect(form.x, form.y, ww, ww, r)

  # no move needed

  setup:
    createCanvas(900, 900)
    rectMode(CENTER)
    # randomSeed(SEED)
    #   background(255)
    #   forms.add(newForm(width/2, height/2, 100))
    let seg = 25
    let w = width / seg
    for i in 0 ..< seg:
      for j in 0 ..< seg:
        let x = i * w + w / 2
        let y = j * w + w / 2
        forms.add(newForm(x, y, w))       

  draw:
    background(255)
    for f in forms:
      f.show()
      #f.move()

nbJsShowSource()
nbJsFromCode():
  keyPressed:
    if $key == "s":
      echo "saving gif okazz_221026a"
      saveGif(cstring("okazz_221026a"), 5)
nbText: "press 's' to export a 5 second gif"
nbSave