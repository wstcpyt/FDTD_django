// Generated by CoffeeScript 1.9.1
(function() {
  suite('basic', function() {
    return suite('ready', function() {
      setup(function() {
        return this.d3chart = fixture('basic');
      });
      test('ready set visualization', function() {
        return assert.notEqual(this.d3chart.visualization, void 0);
      });
      test('webcomponent ready event', function() {
        var event;
        event = new CustomEvent('WebComponentsReady');
        window.dispatchEvent(event);
        return assert.notEqual(this.d3chart.d3line.width, void 0);
      });
      return test('window on resize event', function() {
        var readyevent, resizeevent;
        readyevent = new CustomEvent('WebComponentsReady');
        window.dispatchEvent(readyevent);
        resizeevent = new CustomEvent('resize');
        window.dispatchEvent(resizeevent);
        return assert.notEqual(this.d3chart.d3line.width, void 0);
      });
    });
  });

}).call(this);

//# sourceMappingURL=basictest.js.map
