// Generated by CoffeeScript 1.9.2
(function() {
  define(['./module'], function(module) {
    return module.controller('releaseCtrl', [
      '$scope', '$rootScope', 'releaseService', '$routeParams', function($scope, $rootScope, releaseService, $routeParams) {
        return $scope.$on('$routeChangeSuccess', function() {
          var filterjson, promise;
          if ($routeParams.menu === 'RELEASE NOTE') {
            if (releaseService.releaseversions) {
              filterjson = releaseService.releaseversions.filter(function(row) {
                if (row.version === $routeParams.submenus) {
                  return true;
                } else {
                  return false;
                }
              });
              $scope.releasenotes = filterjson[0]['releasenotes'];
              return $scope.releasedate = filterjson[0]['time'];
            } else {
              promise = releaseService.getdata();
              return promise.then(function(data) {
                filterjson = data.filter(function(row) {
                  if (row.version === $routeParams.submenus) {
                    return true;
                  } else {
                    return false;
                  }
                });
                return $scope.releasenotes = filterjson[0]['releasenotes'];
              });
            }
          }
        });
      }
    ]);
  });

}).call(this);

//# sourceMappingURL=release.ctrl.js.map
