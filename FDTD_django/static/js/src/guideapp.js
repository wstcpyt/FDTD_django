// Generated by CoffeeScript 1.9.2
(function() {
  var app;

  app = angular.module('FDTDapp', ['ngMaterial', 'hljs']);

  app.controller('GuideCtrl', function($scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia, $location) {
    var buildToggler, urlvariable;
    buildToggler = function(navID) {
      var debounceFn;
      debounceFn = $mdUtil.debounce(function() {
        return $mdSidenav(navID).toggle().then(function() {
          return $log.debug("toggle" + navID);
        });
      }, 300);
      return debounceFn;
    };
    $scope.navmenus = [
      {
        'menu': 'REST API',
        'href': '#RESTAPI',
        'formatname': 'RESTAPI',
        'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
      }
    ];
    $scope.toggleLeft = buildToggler('left');
    $scope.screenIsgtmd = $mdMedia('gt-md');
    $scope.$watch(function() {
      return $mdMedia('gt-md');
    }, function() {
      return $scope.screenIsgtmd = $mdMedia('gt-md');
    });
    $scope.selectsubmenu = function(submenu, navmenu) {
      var pageurl;
      pageurl = '/static/guidepage/' + navmenu.menu.replace(' ', '') + submenu.replace(' ', '') + '.html';
      $scope.pageurl = pageurl;
      $scope.submenuselected = submenu;
      $scope.menuselected = navmenu.menu;
      return $location.url('/' + navmenu.menu + '/' + submenu);
    };
    $scope.selectmenu = function(navmenu) {
      return $scope.collapsemenuselected = navmenu.menu;
    };
    urlvariable = $location.url().split(/\s*\/\s*/g);
    if (urlvariable.length === 3) {
      $scope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
      $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
      $scope.menuselected = $scope.collapsemenuselected;
      return $scope.submenuselected = urlvariable[2].replace('%20', ' ');
    } else {
      urlvariable = '/REST%20API/Getting%20Started'.split(/\s*\/\s*/g);
      $scope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
      $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
      $scope.menuselected = $scope.collapsemenuselected;
      return $scope.submenuselected = urlvariable[2].replace('%20', ' ');
    }
  });

  app.controller('LeftCtrl', function($scope, $log, $http) {});

}).call(this);

//# sourceMappingURL=guideapp.js.map
