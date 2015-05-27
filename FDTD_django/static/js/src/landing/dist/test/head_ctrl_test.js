// Generated by CoffeeScript 1.9.2
(function() {
  define(['angular', 'angularMocks', 'controllers/index'], function() {
    return describe('headCtrl', function() {
      beforeEach(module('app.controllers'));
      beforeEach(inject(function(_$controller_) {
        return this.$controller = _$controller_;
      }));
      it('should exist', function() {
        var $scope, controller;
        $scope = {};
        controller = this.$controller('headercontroller', {
          $scope: $scope
        });
        return should.exist(controller);
      });
      return it('selectedIndex', function() {
        var $scope;
        $scope = {};
        this.$controller('headercontroller', {
          $scope: $scope
        });
        return assert.equal($scope.selectedIndex, -1);
      });
    });
  });

}).call(this);

//# sourceMappingURL=head_ctrl_test.js.map
