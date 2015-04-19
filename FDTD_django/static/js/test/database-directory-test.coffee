describe('Unit Test RefractiveIndexController', ->
  root = exports ? this
  beforeEach(module('refractiveIndexApp'))
  beforeEach(inject((_$controller_)->
    this.$controller = _$controller_
  ))
  it('candisplay initial false', ->
    $scope = {}
    controller = this.$controller('RefractiveIndexController', {$scope: $scope})
    $scope.candisplay = false
  )
)

describe('refractiveIndexApp', ->
  root = exports ? this
  beforeEach(module('refractiveIndexApp'))
  beforeEach(inject((_$compile_, _$rootScope_, _$httpBackend_, _$controller_) ->
    this.$controller = _$controller_
    this.$compile = _$compile_
    this.$rootScope = _$rootScope_
    this.$httpBackend = _$httpBackend_
    this.elementlistGetHandler = this.$httpBackend.when('GET', '/elementlist/undefined').respond([{"title": "Ag"},
      {"title": "Au"}])
  ))
  afterEach(->
    this.$httpBackend.verifyNoOutstandingExpectation()
    this.$httpBackend.verifyNoOutstandingRequest()
  )
  it('peter-dropdown listen to the text-changed event', ->
    element = this.$compile("<peter-selector unitest='1' selected-changed></peter-selector>")(this.$rootScope)
    this.$httpBackend.expectGET('/elementlist/undefined')
    element.triggerHandler('selectedtext-changed')
    assert(this.$rootScope.nextdisabled == false)
    this.$httpBackend.flush()
    assert(this.$rootScope.chemelement[0]['title'] == 'Ag')
  )
  it('click next button show the next step', ->
    $scope = {}
    controler = this.$controller('RefractiveIndexController', {$scope: $scope})
    $scope.nextclickHandler()
    assert($scope.candisplay == true)
  )
)