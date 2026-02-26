#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

#let darkred = rgb("#b00008")
#let mainred = rgb("#c80009")

#set page(
  width: auto, height: auto,
  margin: 50pt
)

#figure()[
  #cetz.canvas({
    import cetz.draw: *


    let _phi = (1 + calc.sqrt(5))/2

    let n = 6
    let r = 10
    let R = _phi * r
    let _alpha = 360deg / n
    let _theta = 30deg
    let v = range(n).map(i => (r * calc.cos(_alpha * i + _theta), r * calc.sin(_alpha * i + _theta)))
    let V = range(n).map(i => (R * calc.cos(_alpha * i + _theta), R * calc.sin(_alpha * i + _theta)))

    for i in range(n - 1) {
      

      line(
        v.at(i), V.at(calc.rem(i + 1, n)), v.at(calc.rem(i + 1, n)), v.at(i), fill: darkred
      )

      line(
        v.at(i), V.at(i), v.at(calc.rem(i + 1, n)), v.at(i), fill: mainred
      )
    }
    

  })
]