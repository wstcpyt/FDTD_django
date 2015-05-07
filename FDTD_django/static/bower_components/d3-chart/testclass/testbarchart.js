// Generated by CoffeeScript 1.9.2
(function() {
  var getBars, getsvg;

  describe("Test D3.js with jasmine", function() {
    beforeEach(function() {
      this.c = new barChart();
      this.testData = [
        {
          date: '2014-01',
          value: 100
        }, {
          date: '2014-02',
          value: 140
        }, {
          date: '2014-03',
          value: 215
        }
      ];
      this.c.setData(this.testData);
      return this.c.render();
    });
    afterEach(function() {
      return d3.selectAll('svg').remove();
    });
    describe('the svg', function() {
      it("should be created", function() {
        var result;
        result = getsvg();
        return assert(result !== null);
      });
      it('should have the correct height', function() {
        var result;
        result = getsvg().attr('height');
        return assert(result === '500');
      });
      return it('should have the correct width', function() {
        var result;
        result = getsvg().attr('width');
        return assert(result === '500');
      });
    });
    describe('working with data', function() {
      return it('should be able to update the data', function() {
        var result;
        result = this.c.getData();
        return assert(result === this.testData);
      });
    });
    return describe("create bars", function() {
      it('should render the correct number of bars', function() {
        var result;
        result = getBars().length;
        return assert(result === 3);
      });
      return it('should render the bars with correct height', function() {
        var result;
        return result = d3.select(getBars()[0]).attr('height');
      });
    });
  });

  getsvg = function() {
    return d3.select('svg');
  };

  getBars = function() {
    return d3.selectAll('rect.bar')[0];
  };

}).call(this);

//# sourceMappingURL=testbarchart.js.map