define(['angular', 'angularMocks', 'allmaterial/index'], ->
  describe('allmaterial', ->
    beforeEach(module('app.allmaterial'))
    beforeEach(inject((_$controller_)->
      this.$controller = _$controller_
    ))
    it('allmaterialCtrl should exit', ->
      $scope = {}
      controller = this.$controller('allmaterialCtrl', $scope:$scope)
      should.exist(controller)
    )
  )
)