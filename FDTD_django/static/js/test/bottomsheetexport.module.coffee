describe('Unit Test indexapp.bottomsheetexport', ->
  beforeEach(module('indexapp.bottomsheetexport'))
  beforeEach(module('ngMaterial'))
  beforeEach(module('indexdata.service'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('showGridBottomSheet', ->
    $scope = {}
    this.$controller('bottomCtrl', {$scope: $scope})
  )
)