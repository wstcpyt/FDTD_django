describe('Unit Test Headercontroller', ->
  root = exports ? this
  beforeEach(module('material.components.slider'));
  beforeEach(module('FDTDapp'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('', ->
    $scope = {}
    controller = this.$controller('headercontroller', {$scope: $scope})
    assert.equal(0, 1)
  )
)
