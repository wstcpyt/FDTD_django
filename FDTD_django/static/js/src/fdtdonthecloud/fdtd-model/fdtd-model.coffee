polymer = {
  is: 'fdtd-model'
  properties: {
    numberoflayer: {
      type: Number
      notify: true
      observer: "layernumberChanged"
    }
  }
  attached: ->

  layernumberChanged: ->
    rectdevice = new Rectdevice(this, this.numberoflayer)
    rectdevice.rendersvg()

}

class Rectdevice
  constructor: (@polymerscope, @numberoflayer)->
    this.layernumber = this.numberoflayer
    this.width = 200
    this.height = 500.0/this.layernumber

  rendersvg: ->
    self = this
    color = d3.scale.category20()
    svg = d3.select(self.polymerscope.$$("#id_device_svg"))
    for i in [0 .. this.layernumber-1]
      svg.append("g")
      .data([{x: self.width / 2, y: self.height / 2}])
    rect = d3.selectAll(self.polymerscope.$$("#id_device_svg").getElementsByTagName("g")).append("rect")
    .attr("height", self.height)
    .attr("width", self.width)
    .attr("x", (d)->
      d.x
    )
    .attr("y", (d, i)->
      d.y + i*self.height
    )
    .style("fill", (d, i)->
      color(i)
    )
    .on("click", (d, i)->
      self.polymerscope.$$("#id_fdtd_layer_editor").style.display = "inline-block"
      self.polymerscope.$$("#id_fdtd_layer_editor").layernumber = i
    )
Polymer(polymer)