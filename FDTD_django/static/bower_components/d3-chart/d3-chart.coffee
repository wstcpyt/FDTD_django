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
    data2: {
      type: Array
      value: [{
        "sale": "152",
        "year": "2000"
      }, {
        "sale": "189",
        "year": "2002"
      }, {
        "sale": "179",
        "year": "2004"
      }, {
        "sale": "199",
        "year": "2006"
      }, {
        "sale": "134",
        "year": "2008"
      }, {
        "sale": "176",
        "year": "2010"
      }]
    }
  }
  ready: ->
    _this = this
    root = exports ? this
    $(window).on('resize', ->
      width = _this.$.visualisation.clientWidth
      root.xScale = d3.scale.linear().range([margins.left, width - margins.right]).domain([2000,2010])
      xAxis = d3.svg.axis()
      .scale(root.xScale)
      visualization.select('.x.axis').call(xAxis)
      lineGen = d3.svg.line()
        .x((d) ->
          root.xScale(d.year))
        .y((d) ->
          yScale(d.sale))
        .interpolate("basis")
      visualization.select('#dataset1').attr('d', lineGen(dataset))
    )
    dataset = this.data
    dataset2 = this.data2
    visualization = d3.select(this.$.visualisation)
    width = window.innerWidth*0.5
    height = 500
    margins = {
      top: 20,
      right: 20,
      bottom: 20,
      left: 50
    }
    root.xScale = d3.scale.linear().range([margins.left, width - margins.right]).domain([2000,2010])
    yScale = d3.scale.linear().range([height - margins.top, margins.bottom]).domain([134,215])
    xAxis = d3.svg.axis()
    .scale(root.xScale)
    yAxis = d3.svg.axis()
    .scale(yScale)
    .orient("left")
    visualization.append("svg:g")
    .attr("class","x axis")
    .attr("transform", "translate(0," + (height - margins.bottom) + ")")
    .call(xAxis)
    visualization.append("svg:g")
    .attr("class","axis")
    .attr("transform", "translate(" + (margins.left) + ",0)")
    .call(yAxis)
    lineGen = d3.svg.line()
    .x((d) ->
      root.xScale(d.year))
    .y((d) ->
      yScale(d.sale))
    .interpolate("basis")

    visualization.append('svg:path')
    .attr("id","dataset1")
    .attr('d', lineGen(dataset))
    .attr('stroke', 'green')
    .attr('stroke-width', 2)
    .attr('fill', 'none')

    visualization.append('svg:path')
    .attr('d', lineGen(dataset2))
    .attr('stroke', 'blue')
    .attr('stroke-width', 2)
    .attr('fill', 'none')
}

Polymer(polymer)