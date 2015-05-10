// Generated by CoffeeScript 1.9.1
(function() {
  var app;

  app = angular.module('FDTDapp', ['ngMaterial']);

  app.controller('GuideCtrl', function($scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia) {
    var buildToggler;
    buildToggler = function(navID) {
      var debounceFn;
      debounceFn = $mdUtil.debounce(function() {
        return $mdSidenav(navID).toggle().then(function() {
          return $log.debug("toggle" + navID);
        });
      }, 300);
      return debounceFn;
    };
    $scope.toggleLeft = buildToggler('left');
    $scope.screenIsgtmd = $mdMedia('gt-md');
    return $scope.$watch(function() {
      return $mdMedia('gt-md');
    }, function() {
      return $scope.screenIsgtmd = $mdMedia('gt-md');
    });
  });

  app.controller('LeftCtrl', function($scope, $log, $http) {});

}).call(this);

//# sourceMappingURL=guideapp.js.map
