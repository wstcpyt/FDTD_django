polymer = {
  is: 'd3-chart'
  properties: {
    data: {
      type: Array
      value: [11, 35, 72, 9, 10]
    }
  }
  ready: ->
    dataset = this.data
    console.log(dataset)
    d3.select(this.$.holder).selectAll('div').data(dataset).enter().append('div').attr('class', 'bar').style("height",
    (d)->
      d*2 + "px"
    )
    console.log('finished')
}

Polymer(polymer)