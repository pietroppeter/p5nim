import nimib, index
nbInit
nbRawHtml: """<script src="p5.js"></script>"""
nb.addEntry(6, "Okazz 220919a", """
Art by [Okazz](https://openprocessing.org/user/128718?view=sketches&o=31),
original at [openprocessing.org/sketch/1653811](https://openprocessing.org/sketch/1653811).

License is [CreativeCommons Attribution NonCommercial ShareAlike](https://creativecommons.org/licenses/by-nc-sa/3.0/).

The original sketch has been ported from p5js to p5nim.
""")
# maybe this will be used to train an automatic translator
let sourceOriginalJs = """
let forms = [];
let colors = ['#f70640', '#f78e2c', '#fdd903', '#cae509', '#63be93', '#81cfe5', '#299dbf', '#38187d', '#a4459f', '#f654a9', '#2F0A30'];

function setup() {
	createCanvas(900, 900);

	let c = 18;
	let w = width / c;
	for (let i = 0; i < c; i++) {
		for (let j = 0; j < c; j++) {
			let x = i * w + w / 2;
			let y = j * w + w / 2;
			if ((i + j) % 2 == 0) {
				for (let k = 0; k < 5; k++) {
					forms.push(new Form(x, y));
				}
			}
		}
	}
	background(0);

}

function draw() {

	translate(width / 2, height / 2);
	scale(1.1);
	translate(-width / 2, -height / 2);
	background(255);
	for (let i of forms) {
		i.show();
		i.move();
	}
}

class Form {
	constructor(x, y) {
		this.x = x;
		this.y = y;
		this.x0 = x;
		this.y0 = y;
		this.r0 = random(10, 25);
		this.r = this.r0;
		this.d0 = random(15) * random() + 5;
		this.d = this.d0;
		this.n = int(random(3, 13));
		this.a = random(100);
		this.t = random(10000);
		this.r1 = random(0.01);
		this.r2 = random(0.01);
		this.r3 = random(0.01);
		this.col = color(random(colors));
	}

	show() {
		noStroke();
		fill(this.col);
		push();
		translate(this.x, this.y);
		rotate(this.a);
		for (let i = 0; i < this.n; i++) {
			let theta = map(i, 0, this.n, 0, TAU);
			ellipse(this.r * cos(theta), this.r * sin(theta), this.d, this.d);
		}
		pop();
	}

	move() {
		this.t++;
		this.a = TAU * sin(this.t * this.r1);
		this.r = this.r0 * sin(this.t * this.r2);
		this.d = this.d0 * sin(this.t * this.r3);
		this.x += 0.5;
		this.y -= 0.5;
		if (this.x > width) {
			this.x = 0;
		}
		if (this.y < 0) {
			this.y = height;
		}
	}
}
"""

nbJsFromCode:
  import p5, std / lenientops
  converter toFloat(n: int): float = float(n)
  #converter toPnumber(f: float): PNumber = PNumber(f)

  var colors = @["#f70640", "#f78e2c", "#fdd903", "#cae509", "#63be93", "#81cfe5", "#299dbf", "#38187d", "#a4459f", "#f654a9", "#2F0A30"];

  type
    Form = ref object
      x, y, x0, y0, r0, r, d0, d: float
      a, t, r1, r2, r3: float 
      n: int
      col: string

  var forms: seq[Form]

  proc newForm(x, y: float): Form =
    result = new Form
    result.x = x
    result.y = y
    result.x0 = x
    result.y0 = y
    result.r0 = random(10, 25)
    result.r = result.r0
    result.d0 = random(15) * random() + 5
    result.d = result.d0
    result.n = int(random(3, 13))
    result.a = random(100)
    result.t = random(10000)
    result.r1 = random(0.01)
    result.r2 = random(0.01)
    result.r3 = random(0.01)
    result.col = random(colors)

  proc show(form: Form) =
    noStroke()
    fill(form.col)
    push()
    translate(form.x, form.y)
    rotate(form.a)
    for i in 0 ..< form.n:
      let theta = map(float(i), 0, form.n, 0, PNumber(TAU))
      ellipse(form.r * cos(theta), form.r * sin(theta), form.d, form.d)
    pop()

  proc move(form: Form) =
    form.t += 1
    form.a = TAU * sin(form.t * form.r1);
    form.r = form.r0 * sin(form.t * form.r2);
    form.d = form.d0 * sin(form.t * form.r3);
    form.x += 0.5;
    form.y -= 0.5;
    if form.x > width:
      form.x = 0
    if form.y < 0:
      form.y = height

  setup:
    createCanvas(900, 900)

    var c = 18
    var w = width / c
    for i in 0 ..< c:
      for j in 0 ..< c:
        let x = i * w + w / 2;
        let y = j * w + w / 2;
        if ((i + j) mod 2 == 0):
          for k in 0 ..< 5:
            forms.add(newForm(x, y))
    background(0)

  draw:

    translate(width / 2, height / 2)
    scale(1.1)
    translate(-width / 2, -height / 2)
    background(255)
    for f in forms:
      f.show()
      f.move()

nbJsShowSource()
nbJsFromCode():
  proc keyPressed {.exportc.} =
    if $key == "s":
      echo "saving gif okazz_229019a"
      saveGif(cstring("okazz_229019a"), 2)
nbText: "press 's' to export a 2 second gif"
nbSave