// Generated by CoffeeScript 1.9.2
(function() {
  var Dragcircle, Dragrect, polymer;

  polymer = {
    is: 'fdtd-d3',
    attached: function() {
      var circledom, divdom, dragrect, svgdom;
      divdom = this.$$("#id_svg_div");
      svgdom = this.$$("#id_svg_div").getElementsByTagName("svg");
      circledom = this.$$("#id_svg_div").getElementsByTagName("circle");
      dragrect = new Dragrect(this);
      return dragrect.rendersvg();
    }
  };

  Dragrect = (function() {
    function Dragrect(polymerscope) {
      this.polymerscope = polymerscope;
      this.w = 750;
      this.h = 450;
      this.r = 120;
      this.width = 300;
      this.height = 200;
      this.dragnarw = 20;
    }

    Dragrect.prototype.rendersvg = function() {
      var drag, dragbottom, dragleft, dragright, dragtop, newg, self, svg;
      self = this;
      drag = d3.behavior.drag().origin(Object).on("drag", function(d) {
        return self.dragmove(d);
      });
      dragright = d3.behavior.drag().origin(Object).on("drag", function(d) {});
      dragleft = d3.behavior.drag().origin(Object).on("drag", function(d) {});
      dragtop = d3.behavior.drag().origin(Object).on("drag", function(d) {});
      dragbottom = d3.behavior.drag().origin(Object).on("drag", function(d) {});
      svg = d3.select(self.polymerscope.$$("#id_svg_div")).append("svg").attr("width", self.w).attr("height", self.h);
      newg = svg.append("g").data([
        {
          x: self.width / 2,
          y: self.height / 2
        }
      ]);
      return self.dragrect = newg.append("rect").attr("id", "active").attr("x", function(d) {
        return d.x;
      }).attr("y", function(d) {
        return d.y;
      }).attr("height", self.height).attr("width", self.width).attr("fill-opacity", .5).attr("cursor", "move").call(drag);
    };

    Dragrect.prototype.dragmove = function(d) {
      var self;
      self = this;
      return self.dragrect.attr("y", d.y = Math.max(0, Math.min(self.h - self.height, d3.event.y)));
    };

    return Dragrect;

  })();

  Dragcircle = (function() {
    function Dragcircle(polymerscope, divdom1, svgdom1, circledom1) {
      this.polymerscope = polymerscope;
      this.divdom = divdom1;
      this.svgdom = svgdom1;
      this.circledom = circledom1;
      this.width = 240;
      this.height = 125;
      this.radius = 20;
    }

    Dragcircle.prototype.rendersvg = function() {
      var circle, drag, i, j, self, svg;
      self = this;
      for (i = j = 0; j <= 15; i = ++j) {
        d3.select(self.polymerscope.$$("#id_svg_div")).append("svg").style("border-bottom", "solid 1px #ccc").style("border-right", "solid 1px #ccc").style("margin-right", "-1px").style("margin-bottom", "-1px");
      }
      drag = d3.behavior.drag().origin(function(d) {
        return d;
      }).on("drag", function(d) {
        return self.dragmove(d, this);
      });
      svg = d3.selectAll(self.svgdom).data(d3.range(16).map(function() {
        return {
          x: self.width / 2,
          y: self.height / 2
        };
      })).attr("width", self.width).attr("height", self.height);
      svg.append("circle");
      return circle = d3.selectAll(self.circledom).attr("r", self.radius).attr('cx', function(d) {
        return d.x;
      }).attr("cy", function(d) {
        return d.y;
      }).call(drag);
    };

    Dragcircle.prototype.dragmove = function(d, scope) {
      return d3.select(scope).attr("cx", d.x = Math.max(this.radius, Math.min(this.width - this.radius, d3.event.x))).attr("cy", d.y = Math.max(this.radius, Math.min(this.height - this.radius, d3.event.y)));
    };

    return Dragcircle;

  })();

  Polymer(polymer);

}).call(this);

//# sourceMappingURL=fdtd-d3.js.map
