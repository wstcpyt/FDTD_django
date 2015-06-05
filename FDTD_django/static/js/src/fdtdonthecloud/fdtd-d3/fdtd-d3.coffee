polymer ={
  is: 'fdtd-d3',
  attached: ->
    width = 240
    height = 125
    radius = 20
    for i in [0 .. 15]
      d3.select(this.$$("#id_svg_div")).append("svg")
    svg = d3.selectAll(this.$$("#id_svg_div").getElementsByTagName("svg"))
      .data(d3.range(16).map(->
          {x: width/2, y: height/2}
        ))
      .attr("width", width)
      .attr("height", height)
    svg.append("circle")
      .attr("r", radius)
      .attr('cx', (d)->
        d.x
      )
      .attr("cy", (d)->
        d.y
      )
      .on("click", dragmove)
    circle = d3.selectAll(this.$$("#id_svg_div").getElementsByTagName("circle"))
      .on("click", dragmove)
    dragmove = ->
      console.log("clicked")

}

Polymer(polymer)