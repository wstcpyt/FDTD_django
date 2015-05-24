// Generated by CoffeeScript 1.9.2
(function() {
  define(['./module'], function(module) {
    return module.controller('SidenavCtrl', [
      '$rootScope', '$scope', '$timeout', '$mdSidenav', '$mdUtil', '$log', '$mdMedia', 'releaseService', function($rootScope, $scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia, releaseService) {
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
        $rootScope.$on('submenuclicked', function() {
          if ($scope.screenIsgtmd) {
            return $log.debug('screen is gt-md');
          } else {
            return $mdSidenav('left').close();
          }
        });
        $scope.toggleLeft = buildToggler('left');
        $scope.screenIsgtmd = $mdMedia('gt-md');
        return $scope.$watch(function() {
          return $mdMedia('gt-md');
        }, function() {
          return $scope.screenIsgtmd = $mdMedia('gt-md');
        });
      }
    ]);
  });

}).call(this);

//# sourceMappingURL=sidenav.ctrl.js.map
