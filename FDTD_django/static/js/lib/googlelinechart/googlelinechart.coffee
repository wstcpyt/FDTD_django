google.load('visualization', '1.1', {packages: ['line']});
@drawChart = (dataArray)->
  data = new google.visualization.DataTable()
  data.addColumn('number', 'Wavelength')
  data.addColumn('number', 'n')
  data.addColumn('number', 'k')
  data.addRows(dataArray)

  options = {
    chart: {
      title: 'Box Office Earnings in First Two Weeks of Opening',
      subtitle: 'in millions of dollars (USD)',
    }
  }

  chart = new google.charts.Line(document.getElementById('linechart_material'))
  chart.draw(data, options)
