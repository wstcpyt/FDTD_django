// Generated by CoffeeScript 1.9.2
(function() {
  var fdtdcloudapp;

  fdtdcloudapp = angular.module('fdtdcloudapp', ['ngRoute']);

  fdtdcloudapp.config([
    '$routeProvider', '$interpolateProvider', function($routeProvider, $interpolateProvider) {
      $interpolateProvider.startSymbol('//');
      $interpolateProvider.endSymbol('//');
      return $routeProvider.when('/', {
        templateUrl: '/static/js/src/fdtdonthecloud/main/drafts.html'
      }).when('/:menu/:index', {
        templateUrl: function(params) {
          return '/static/js/src/fdtdonthecloud/main/' + params.menu.replace(' ', '') + '.html';
        }
      });
    }
  ]);

  fdtdcloudapp.controller('RouteCtrl', [
    '$scope', '$routeParams', function($scope, $routeParams) {
      return $scope.$on('$routeChangeSuccess', function() {
        if ($routeParams.menu && $routeParams.index) {
          return $scope.selectedindex = $routeParams.index;
        } else {
          return $scope.selectedindex = 0;
        }
      });
    }
  ]);

}).call(this);

//# sourceMappingURL=app.js.map