// Generated by CoffeeScript 1.9.1
(function() {
  define(['./module'], function(controllers) {
    'use strict';
    return controllers.controller('headercontroller', [
      '$scope', function($scope) {
        var tabvalue;
        tabvalue = $('#tabindex').val();
        tabvalue = parseInt(tabvalue);
        $scope.selectedIndex = tabvalue;
        $scope.tab2clicked = function() {
          return window.location.href = "/databasedirectory/";
        };
        return $scope.tab1clicked = function() {
          return window.location.href = "/";
        };
      }
    ]);
  });

}).call(this);

//# sourceMappingURL=head.ctrl.js.map