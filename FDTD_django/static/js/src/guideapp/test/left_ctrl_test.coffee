define(['angular','angularMocks','controllers/index','services/index', 'app'],->
  describe('leftCtrl', ->
    beforeEach(module('app.controllers'))
    beforeEach(module('app'))
    beforeEach(inject((_$controller_, _$location_, _$rootScope_)->
      this.$controller = _$controller_
      this.$location = _$location_
      this.$rootScope = _$rootScope_
    ))
    it('should exist', ->
      $scope = {}
      $scope.$on = ->
        1
      controller = this.$controller('LeftCtrl',{$scope:$scope})
      should.exist(controller)
    )
    it('selectsubmenu', ->
      $scope = {}
      $scope.$on = ->
        1
      this.$controller('LeftCtrl', {$scope: $scope})
      navmenu = {
        'menu': 'test2'
      }
      $scope.selectsubmenu('test1', navmenu)
      assert.equal(this.$location.url(), '/test2/test1')
      assert.equal($scope.submenuselected, 'test1')
      assert.equal($scope.menuselected, 'test2')
    )
    it('selectmenu', ->
      $scope = {}
      $scope.$on = ->
        1
      this.$controller('LeftCtrl', {$scope: $scope})
      navmenu = {
        'menu': 'test2'
      }
      $scope.selectmenu(navmenu)
      assert.equal($scope.collapsemenuselected, 'test2')
    )
    it('generateversionarray', ->
      $scope = {}
      $scope.$on = ->
        1
      controller = this.$controller('LeftCtrl', {$scope: $scope})
      data = [
        {'version': '0.1.0'},
        {'version': '0.1.1'}
      ]
      releaseversions = controller.generateversionarray(data)
      assert.equal(releaseversions.length, 2)
      assert.equal(releaseversions[0], '0.1.0')
    )
  )
)