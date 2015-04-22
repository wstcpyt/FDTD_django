polymer = {
  is: 'd3-chart'
  properties: {
    data: {
      type: Array
      value: [{
        "sale": "202",
        "year": "2000"
      }, {
        "sale": "215",
        "year": "2001"
      }, {
        "sale": "179",
        "year": "2002"
      }, {
        "sale": "199",
        "year": "2003"
      }, {
        "sale": "134",
        "year": "2004"
      },{
        "sale": "176",
        "year": "2010"
      }]
    }
  }
  ready: ->
    dataset = this.data
    vis = d3.select(this.$.visualisation)
    WIDTH = 1000
    HEIGHT = 500
    MARGINS = {
      top: 20,
      right: 20,
      bottom: 20,
      left: 50
    }
    xScale = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([2000,2010])
    yScale = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([134,215])
    xAxis = d3.svg.axis()
      .scale(xScale)
    yAxis = d3.svg.axis()
      .scale(yScale)
      .orient("left")
    vis.append("svg:g")
      .attr("transform", "translate(0," + (HEIGHT - MARGINS.bottom) + ")")
      .call(xAxis)
    vis.append("svg:g")
      .attr("transform", "translate(" + (MARGINS.left) + ",0)")
      .call(yAxis)
    lineGen = d3.svg.line()
      .x((d) ->
        return xScale(d.year))
      .y((d) ->
        return yScale(d.sale))

    vis.append('svg:path')
      .attr('d', lineGen(dataset))
      .attr('stroke', 'green')
      .attr('stroke-width', 2)
      .attr('fill', 'none')
}

Polymer(polymer)