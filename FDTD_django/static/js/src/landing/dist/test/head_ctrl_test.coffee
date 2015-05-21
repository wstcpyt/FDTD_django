define(['angular','angularMocks','controllers/index'], ->
  describe('headCtrl', ->
    beforeEach(module('app.controllers'))
    beforeEach(inject((_$controller_)->
      this.$controller = _$controller_
    ))
    it('should exist', ->
        $scope = {}
        controller = this.$controller('headercontroller',{$scope:$scope})
        should.exist(controller)
    )
    it('selectedIndex', ->
        $scope = {}
        this.$controller('headercontroller',{$scope:$scope})
        assert.equal($scope.selectedIndex,-1)
    )
  )
)