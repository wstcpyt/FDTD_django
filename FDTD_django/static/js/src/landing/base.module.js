// Generated by CoffeeScript 1.9.2
(function() {
  var app;

  app = angular.module('FDTDapp', ['ngMaterial', 'head.ctrl']);

  app.controller('headercontroller', [
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

}).call(this);

//# sourceMappingURL=base.module.js.map
