define(['angular', 'angularMocks', 'leftmenu/index', 'app'], ->
  describe('leftmenu', ->
    beforeEach(module('app'))
    beforeEach(module('app.leftmenu'))
    beforeEach(inject((_$controller_)->
      this.$controller = _$controller_
    ))
    it('navmenus', ->
      $scope = {}
      $scope.$on = ->
        1
      this.$controller('LeftCtrl', $scope:$scope)
      assert.equal($scope.navmenus[0]['menu'], 'SEARCH')
    )
    it('selectmenu', ->
      $scope = {}
      $scope.$on = ->
        1
      this.$controller('LeftCtrl', $scope:$scope)
      $scope.selectmenu($scope.navmenus[0])
      assert.equal($scope.menuselected, 'SEARCH')
    )
  )
)
