// Generated by CoffeeScript 1.9.2
(function() {
  define(['./module'], function(module) {
    return module.controller('LeftCtrl', [
      '$scope', '$location', '$rootScope', function($scope, $location, $rootScope) {
        var urlvariable;
        $scope.navmenus = [
          {
            'menu': 'REST API',
            'href': '#RESTAPI',
            'formatname': 'RESTAPI',
            'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
          }, {
            'menu': 'RELEASE NOTE',
            'href': '#RELEASENOTE',
            'formatname': 'RELEASENOTE',
            'submenus': ['0.1.0']
          }
        ];
        $scope.selectsubmenu = function(submenu, navmenu) {
          var pageurl;
          pageurl = '/static/guidepage/' + navmenu.menu.replace(' ', '') + submenu.replace(' ', '') + '.html';
          $rootScope.pageurl = pageurl;
          $rootScope.maintoolbartitle = submenu;
          $scope.submenuselected = submenu;
          $scope.menuselected = navmenu.menu;
          $location.url('/' + navmenu.menu + '/' + submenu);
          return $rootScope.$emit('submenuclicked');
        };
        $scope.selectmenu = function(navmenu) {
          return $scope.collapsemenuselected = navmenu.menu;
        };
        urlvariable = $location.url().split(/\s*\/\s*/g);
        if (urlvariable.length === 3) {
          $rootScope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
          $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
          $scope.menuselected = $scope.collapsemenuselected;
          $scope.submenuselected = urlvariable[2].replace('%20', ' ');
          return $rootScope.maintoolbartitle = urlvariable[2].replace('%20', ' ');
        } else {
          urlvariable = '/REST%20API/Getting%20Started'.split(/\s*\/\s*/g);
          $rootScope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
          $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
          $scope.menuselected = $scope.collapsemenuselected;
          $scope.submenuselected = urlvariable[2].replace('%20', ' ');
          return $rootScope.maintoolbartitle = urlvariable[2].replace('%20', ' ');
        }
      }
    ]);
  });

}).call(this);

//# sourceMappingURL=left.ctrl.js.map
