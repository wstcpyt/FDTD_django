// Generated by CoffeeScript 1.9.1
(function() {
  var Polymerobject;

  Polymerobject = {
    is: "material-button",
    properties: {
      link: {
        type: String,
        value: '#'
      },
      raised: {
        type: Boolean
      }
    },
    listeners: {
      'click': 'handleClick'
    },
    handleClick: function() {
      return window.location.href = this.link;
    }
  };

  Polymer(Polymerobject);

}).call(this);

//# sourceMappingURL=material-button.js.map
