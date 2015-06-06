polymer ={
  is: 'fdtd-d3',
  attached: ->
    divdom = this.$$("#id_svg_div")
    svgdom = this.$$("#id_svg_div").getElementsByTagName("svg")
    circledom = this.$$("#id_svg_div").getElementsByTagName("circle")
    dragcircle = new Dragcircle(this, divdom, svgdom, circledom)
    dragcircle.rendersvg()

}

class Dragcircle
  constructor: (@polymerscope, @divdom, @svgdom, @circledom)->
    this.width = 240
    this.height = 125
    this.radius = 20

  rendersvg: ->
    self = this
    for i in [0 .. 15]
      d3.select( self.polymerscope.$$("#id_svg_div")).append("svg")
        .style("border-bottom", "solid 1px #ccc")
        .style("border-right", "solid 1px #ccc")
        .style("margin-right", "-1px")
        .style("margin-bottom", "-1px")

    dragfunction = (d)->
          d3.select(this)
            .attr("cx", d.x = Math.max(self.radius, Math.min(self.width - self.radius, d3.event.x)))
            .attr("cy", d.y = Math.max(self.radius, Math.min(self.height - self.radius, d3.event.y)))

    drag = d3.behavior.drag()
      .origin((d)->
        d)
      .on("drag", dragfunction)
    svg = d3.selectAll(self.svgdom)
      .data(d3.range(16).map(->
          {x: self.width/2, y: self.height/2}
        ))
      .attr("width",self.width)
      .attr("height", self.height)
    svg.append("circle")
    circle = d3.selectAll(self.circledom)
      .attr("r", self.radius)
      .attr('cx', (d)->
        d.x
      )
      .attr("cy", (d)->
        d.y
      )
      .call(drag)

Polymer(polymer)