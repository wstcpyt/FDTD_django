describe('Unit Test guideapp.ctrl', ->
  root = exports ? this
  beforeEach(module('FDTDapp.guideapp.ctrl'))
  beforeEach(inject((_$controller_, _$location_, _$rootScope_)->
    this.$controller = _$controller_
    this.$location = _$location_
    this.$rootScope = _$rootScope_
  )
  )
  it('selectsubmenu', ->
    $scope = {}
    controller = this.$controller('LeftCtrl', {$scope: $scope})
    navmenu = {
      'menu': 'test2'
    }
    $scope.selectsubmenu('test1', navmenu)
    assert.equal(this.$location.url(), '/test2/test1')
    assert.equal(this.$rootScope.pageurl, '/static/guidepage/test2test1.html')
    assert.equal($scope.submenuselected, 'test1')
    assert.equal($scope.menuselected, 'test2')
  )
  it('selectmenu', ->
    $scope = {}
    controller = this.$controller('LeftCtrl', {$scope: $scope})
    navmenu = {
      'menu': 'test2'
    }
    $scope.selectmenu(navmenu)
    assert.equal($scope.collapsemenuselected, 'test2')
  )
)
