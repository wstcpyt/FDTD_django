google.load('visualization', '1.1', {packages: ['line']});
@drawChart = (dataArray, JSONDATA)->
  data = new google.visualization.DataTable()
  data.addColumn('number', 'Wavelength (µm)')
  data.addColumn('number', 'n')
  if dataArray[0].length == 3
    data.addColumn('number', 'k')
  data.addRows(dataArray)

  options = {
    chart: {
      title: JSONDATA['ELEMENT'],
      subtitle: '(' +JSONDATA['PAPER'] + ')',
    }
  }
  chart = new google.charts.Line(document.getElementById('linechart_material'))
  chart.draw(data, options)
  $(window).resize(->
    chart.draw(data, options)
  )