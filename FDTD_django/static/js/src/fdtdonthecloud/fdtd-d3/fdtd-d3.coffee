polymer ={
  is: 'fdtd-d3',
  attached: ->
    #polymer insert first
    dataarray = [32, 57, 112, 293]
    circlenode = this.$$('#id_div').getElementsByTagName('circle')
    lendef = dataarray.length - circlenode.length
    for i in [0 .. lendef-1]
      d3.select(this.$$('#id_svg')).append('circle')
    ####################
    circle = d3.selectAll(circlenode)
     .data(dataarray)
    circle.style("fill", "steelblue")
    circle.attr("cy", 60)
    circle.attr("cx", (d, i)->
      i*100 + 30
    )
    circle.attr("r", (d)->
      Math.sqrt(d)
    )

}

Polymer(polymer)