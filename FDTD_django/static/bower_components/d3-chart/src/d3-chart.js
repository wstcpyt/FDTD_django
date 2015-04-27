// Generated by CoffeeScript 1.9.1
(function() {
  var polymer;

  polymer = {
    is: 'd3-chart',
    properties: {
      zerodata: {
        type: Array,
        value: [
          {
            "sale": "0",
            "year": "0"
          }, {
            "sale": "0",
            "year": "0"
          }, {
            "sale": "0",
            "year": "0"
          }, {
            "sale": "0",
            "year": "0"
          }, {
            "sale": "0",
            "year": "0"
          }, {
            "sale": "0",
            "year": "0"
          }
        ]
      },
      data1: {
        type: Array,
        value: [
          {
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
          }, {
            "sale": "176",
            "year": "2010"
          }
        ]
      },
      data2: {
        type: Array,
        value: [
          {
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
          }
        ]
      }
    },
    ready: function() {
      var _this;
      _this = this;
      this.visualization = this.$.visualization;
      window.addEventListener('WebComponentsReady', function() {
        _this.d3line = new D3Line(_this.visualization, _this.data1, _this.data2);
        return _this.d3line.draw();
      });
      return d3.select(window).on('resize', function() {
        _this.d3line.width = _this.visualization.clientWidth;
        return _this.d3line._setresponsive();
      });
    }
  };

  Polymer(polymer);

}).call(this);

//# sourceMappingURL=d3-chart.js.map
