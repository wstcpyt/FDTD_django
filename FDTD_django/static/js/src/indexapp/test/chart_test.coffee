define(['angular','angularMocks', 'chart/index', 'common/index'],->
  describe('chart', ->
    beforeEach(module('app.chart'))
    beforeEach(module('app.common'))
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
)