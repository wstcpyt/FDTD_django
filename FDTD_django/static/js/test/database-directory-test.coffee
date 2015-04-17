describe('RefractiveIndexController', ->
  root = exports ? this
  beforeEach(module('refractiveIndexApp'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('candisplay initial false', ->
    $scope = {}
    controller = this.$controller('RefractiveIndexController', { $scope: $scope })
    $scope.candisplay = false
  )
)