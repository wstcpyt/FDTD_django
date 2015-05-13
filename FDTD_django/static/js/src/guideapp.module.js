// Generated by CoffeeScript 1.9.1
(function() {
  var app;

  app = angular.module('FDTDapp', ['FDTDapp.appbase', 'hljs']);

  app.controller('LeftCtrl', function($scope, $location, $rootScope) {
    var urlvariable;
    $rootScope.maintoolbartitle = "Getting Started";
    $scope.navmenus = [
      {
        'menu': 'REST API',
        'href': '#RESTAPI',
        'formatname': 'RESTAPI',
        'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
      }
    ];
    $scope.selectsubmenu = function(submenu, navmenu) {
      var pageurl;
      pageurl = '/static/guidepage/' + navmenu.menu.replace(' ', '') + submenu.replace(' ', '') + '.html';
      $rootScope.pageurl = pageurl;
      $rootScope.maintoolbartitle = submenu;
      $scope.submenuselected = submenu;
      $scope.menuselected = navmenu.menu;
      return $location.url('/' + navmenu.menu + '/' + submenu);
    };
    $scope.selectmenu = function(navmenu) {
      return $scope.collapsemenuselected = navmenu.menu;
    };
    urlvariable = $location.url().split(/\s*\/\s*/g);
    if (urlvariable.length === 3) {
      $rootScope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
      $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
      $scope.menuselected = $scope.collapsemenuselected;
      return $scope.submenuselected = urlvariable[2].replace('%20', ' ');
    } else {
      urlvariable = '/REST%20API/Getting%20Started'.split(/\s*\/\s*/g);
      $rootScope.pageurl = '/static/guidepage/' + urlvariable[1].replace('%20', '') + urlvariable[2].replace('%20', '') + '.html';
      $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ');
      $scope.menuselected = $scope.collapsemenuselected;
      return $scope.submenuselected = urlvariable[2].replace('%20', ' ');
    }
  });

}).call(this);

//# sourceMappingURL=guideapp.module.js.map
