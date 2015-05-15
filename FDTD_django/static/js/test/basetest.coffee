describe('Unit Test Headercontroller', ->
  root = exports ? this
  beforeEach(module('head.ctrl'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('tab2clicked', ->
    #$scope = {}
    #controller = this.$controller('headercontroller', {$scope: $scope})
    #assert.equal($scope.tab2clicked(), '/databasedirectory/')
  )
)