// Generated by CoffeeScript 1.9.2
(function() {
  var Nav, Point, add_core_media_event_handler, polymer, setresponsivenav;

  polymer = {
    is: 'collapse-menu',
    properties: {
      query: {
        type: String,
        observer: 'queryChanged'
      },
      screenmatched: {
        type: Boolean
      }
    },
    queryChanged: function() {
      return this.screenmatched = this.$.coremediaid.queryMatches;
    },
    ready: function() {
      return setresponsivenav(this);
    }
  };

  Nav = (function() {
    function Nav(menunav, smallscreennav) {
      this.menunav = menunav;
      this.smallscreennav = smallscreennav;
    }

    Nav.prototype.toggleNav = function(queryMatches) {
      if (queryMatches) {
        this.menunav.style.display = 'none';
        return this.smallscreennav.style.display = '';
      } else {
        this.menunav.style.display = '';
        return this.smallscreennav.style.display = 'none';
      }
    };

    return Nav;

  })();

  setresponsivenav = function(_this) {
    _this.nav = new Nav(_this.$.menunavid, _this.$.smallscreennavid);
    _this.nav.toggleNav(_this.$.coremediaid.queryMatches);
    return add_core_media_event_handler(_this);
  };

  add_core_media_event_handler = function(_this) {
    return _this.$.coremediaid.addEventListener('query-matches-changed', function() {
      return _this.nav.toggleNav(_this.$.coremediaid.queryMatches);
    });
  };

  Polymer(polymer);

  Point = function(x, y) {
    this.x = x;
    return this.y = y;
  };

}).call(this);

//# sourceMappingURL=collapse-menu.js.map
