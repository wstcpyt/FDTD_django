describe('Unit Test RefractiveIndexController', ->
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

describe('Unit Testing textChanged', ->
  root = exports ? this
  beforeEach(module('refractiveIndexApp'))
  beforeEach(inject((_$compile_, _$rootScope_) ->
    this.$compile = _$compile_
    this.$rootScope = _$rootScope_
  ))
  it('listen to the text-changed event', ->
    element = this.$compile("<div unitest='1' text-changed></div>")(this.$rootScope)
    this.$rootScope.candisplay = false
    element.selected = '0'
    element.triggerHandler('buttontext-changed')
    assert(this.$rootScope.candisplay == true)
  )
)