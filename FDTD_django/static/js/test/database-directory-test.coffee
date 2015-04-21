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

describe('refractiveIndex Selection process', ->
  root = exports ? this
  beforeEach(module('refractiveIndexApp'))
  beforeEach(inject((_$compile_, _$rootScope_, _$httpBackend_, _$controller_) ->
    this.$controller = _$controller_
    this.$compile = _$compile_
    this.$rootScope = _$rootScope_
    this.$httpBackend = _$httpBackend_
    this.elementitemsGetHandler = this.$httpBackend.when('GET', '/elementitems/undefined/').respond([{"title": "Ag"},
      {"title": "Au"}])
    this.elementlistitemsGetHandler = this.$httpBackend.when('GET', '/elementlistitems/undefined/').respond([{"title": "peter"},
      {"title": "jack"}])
  ))
  afterEach(->
    this.$httpBackend.verifyNoOutstandingExpectation()
    this.$httpBackend.verifyNoOutstandingRequest()
  )
  it('category selector listen to the selecttext-changed event', ->
    element = this.$compile("<peter-selector unitest='1' category-changed-handler></peter-selector>")(this.$rootScope)
    this.$httpBackend.expectGET('/elementitems/undefined/')
    element.triggerHandler('selectedtext-changed')
    assert(this.$rootScope.categorynextdisabled == false)
    this.$httpBackend.flush()
    assert(this.$rootScope.chemelement[0]['title'] == 'Ag')
  )
  it('click category next button show the next step', ->
    $scope = {}
    controler = this.$controller('RefractiveIndexController', {$scope: $scope})
    $scope.categorynextclickHandler()
    assert($scope.categorydisplay == false)
    assert($scope.elementdisplay == true)
  )
  it('element selector listen to the selecttext-changed event', ->
    element = this.$compile("<peter-selector unitest='1' element-changed-handler></peter-selector>")(this.$rootScope)
    this.$httpBackend.expectGET('/elementlistitems/undefined/')
    element.triggerHandler('selectedtext-changed')
    assert(this.$rootScope.elementnextdisabled == false)
    this.$httpBackend.flush()
  )
  it('click element next button show the next step', ->
    $scope = {}
    controler = this.$controller('RefractiveIndexController', {$scope: $scope})
    $scope.elementnextclickHandler()
    assert($scope.elementdisplay == false)
    assert($scope.elementlistdisplay == true)

  )
  it('elementlist selector listen to the selecttext-changed event', ->
    element = this.$compile("<peter-selector unitest='1' elementlist-changed-handler></peter-selector>")(this.$rootScope)
    element.triggerHandler('selectedtext-changed')
    assert(this.$rootScope.elementlistnextdisabled == false)
  )
  it('Click Elementlist next button show the result', ->
    $scope = {}
    controler = this.$controller('RefractiveIndexController', {$scope: $scope})
    $scope.elementlistnextclickHandler()
    assert($scope.elementlistdisplay == false)
    assert($scope.resultdisplay == true)
  )
)