define(['angular','angularMocks','controllers/module', 'controllers/left.ctrl'],->
  beforeEach(module('app.controllers'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('should exist', ->
    $scope = {}
    controller = this.$controller('LeftCtrl',{$scope:$scope})
    should.exist(controller)
  )

)