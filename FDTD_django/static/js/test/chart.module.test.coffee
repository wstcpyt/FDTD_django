describe('Unit Test indexapp.chart', ->
  beforeEach(module('indexapp.chart'))
  beforeEach(module('indexdata.service'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('drawIndexChart', ->
    $scope = {}
    this.$controller('chartCtrl', {$scope: $scope})
    item = {
      id: 1,
      title: 'peter'
    }
    $scope.drawIndexChart(item)
    assert.equal($scope.paperselected, 'peter')
  )
)
