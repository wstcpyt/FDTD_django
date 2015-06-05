polymer ={
  is: 'fdtd-d3',
  attached: ->
    self = this
    width = 240
    height = 125
    radius = 20
    for i in [0 .. 15]
      d3.select(this.$$("#id_svg_div")).append("svg")
        .style("border-bottom", "solid 1px #ccc")
        .style("border-right", "solid 1px #ccc")
        .style("margin-right", "-1px")
        .style("margin-bottom", "-1px")

    drag = d3.behavior.drag()
      .origin((d)->
        d)
      .on("drag", (d)->
          d3.select(this)
            .attr("cx", d.x = Math.max(radius, Math.min(width - radius, d3.event.x)))
            .attr("cy", d.y = Math.max(radius, Math.min(height - radius, d3.event.y)))
      )
    svg = d3.selectAll(this.$$("#id_svg_div").getElementsByTagName("svg"))
      .data(d3.range(16).map(->
          {x: width/2, y: height/2}
        ))
      .attr("width", width)
      .attr("height", height)
    svg.append("circle")
    circle = d3.selectAll(this.$$("#id_svg_div").getElementsByTagName("circle"))
      .attr("r", radius)
      .attr('cx', (d)->
        d.x
      )
      .attr("cy", (d)->
        d.y
      )
      .call(drag)
}
Polymer(polymer)