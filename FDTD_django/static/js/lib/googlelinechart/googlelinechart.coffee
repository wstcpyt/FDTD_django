google.load('visualization', '1.1', {packages: ['line']});
@drawChart = (dataArray)->
  data = new google.visualization.DataTable()
  data.addColumn('number', 'Wavelength')
  data.addColumn('number', 'n')
  data.addColumn('number', 'k')
  data.addRows(dataArray)

  options = {
  }

  chart = new google.charts.Line(document.getElementById('linechart_material'))
  chart.draw(data, options)
