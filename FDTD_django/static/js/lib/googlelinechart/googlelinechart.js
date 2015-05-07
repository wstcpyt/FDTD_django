// Generated by CoffeeScript 1.9.2
(function() {
  google.load('visualization', '1.1', {
    packages: ['line']
  });

  this.drawChart = function(dataArray, JSONDATA) {
    var chart, data, options;
    data = new google.visualization.DataTable();
    data.addColumn('number', 'Wavelength (µm)');
    data.addColumn('number', 'n');
    data.addColumn('number', 'k');
    data.addRows(dataArray);
    options = {
      chart: {
        title: JSONDATA['ELEMENT'],
        subtitle: '(' + JSONDATA['PAPER'] + ')'
      }
    };
    chart = new google.charts.Line(document.getElementById('linechart_material'));
    chart.draw(data, options);
    return $(window).resize(function() {
      return chart.draw(data, options);
    });
  };

}).call(this);

//# sourceMappingURL=googlelinechart.js.map
