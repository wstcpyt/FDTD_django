describe('Unit Test SearchCtrl', ->
  root = exports ? this
  beforeEach(module('material.components.slider'));
  beforeEach(module('FDTDapp'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('', ->
    $scope = {}
    controller = this.$controller('SearchCtrl', {$scope: $scope})
    loadAll()
    result = createFilterFor('a')
    console.log(result)
  )
)
