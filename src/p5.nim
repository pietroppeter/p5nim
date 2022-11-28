when defined(js):
    import p5 / [p5js, p5sugar]
    export p5js, p5sugar

    import std / lenientops
    export lenientops
    converter toFloat*(n: int): float = float(n)
else:
    import p5 / p5nimib
    export p5nimib