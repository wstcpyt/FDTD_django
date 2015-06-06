polymer ={
  is: 'fdtd-d3',
  attached: ->
    divdom = this.$$("#id_svg_div")
    svgdom = this.$$("#id_svg_div").getElementsByTagName("svg")
    circledom = this.$$("#id_svg_div").getElementsByTagName("circle")
    dragcircle = new Dragcircle(this, divdom, svgdom, circledom)
    dragcircle.rendersvg()

}


class Dragrect
  constructor: ()->
    this.w = 750
    this.h = 450
    this.r = 120
    this.width = 300
    this.height = 200
    this.dragnarw = 20

  rendersvg: ->



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

    drag = d3.behavior.drag()
    .origin((d)->
      d)
    .on("drag", (d)->
      self.dragmove(d, this)
    )



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

  dragmove: (d, scope)->
    d3.select(scope)
    .attr("cx", d.x = Math.max(this.radius, Math.min(this.width - this.radius, d3.event.x)))
    .attr("cy", d.y = Math.max(this.radius, Math.min(this.height - this.radius, d3.event.y)))

Polymer(polymer)