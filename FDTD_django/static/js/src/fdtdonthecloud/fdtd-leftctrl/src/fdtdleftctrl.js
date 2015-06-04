// Generated by CoffeeScript 1.9.2
(function() {
  var polymer;

  polymer = {
    is: 'fdtd-leftctrl',
    properties: {
      menuselected: {
        type: Object,
        notify: true
      },
      selectedindex: {
        type: String,
        notify: true
      }
    },
    ready: function() {
      var self;
      self = this;
      self.menuItems = [
        {
          menu: 'Drafts',
          icon: 'drafts'
        }, {
          menu: 'Done',
          icon: 'done'
        }
      ];
      return self.$.leftmenu.addEventListener('selected-changed', function() {
        self.menuselected = self.menuItems[self.$.leftmenu.selected];
        return window.location = '#/' + self.menuItems[self.$.leftmenu.selected].menu + '/' + self.$.leftmenu.selected;
      });
    }
  };

  Polymer(polymer);

}).call(this);

//# sourceMappingURL=fdtdleftctrl.js.map