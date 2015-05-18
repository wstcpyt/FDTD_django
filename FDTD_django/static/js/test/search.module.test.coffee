describe('Unit Test indexapp.search', ->
  beforeEach(module('indexapp.search'))
  beforeEach(inject((_$controller_, _$httpBackend_, _$http_)->
    this.$http = _$http_
    this.$controller = _$controller_
    this.$httpBackend = _$httpBackend_
    this.$httpBackend.when('GET', '/elementitems/all/').respond([{"title":"Ag"},{"title":"Ag3AsS3"}])
    this.$httpBackend.when('GET', '/elementlistitems/Ag/').respond([{"title":"peter"},{"title":"jack"}])
  ))
  afterEach(->
    this.$httpBackend.verifyNoOutstandingExpectation()
    this.$httpBackend.verifyNoOutstandingRequest()
  )
  it('SearchCtrl', ->
    $scope = {}
    controller = this.$controller('SearchCtrl', {$scope: $scope})
    this.$httpBackend.expectGET('/elementitems/all/')
    this.$httpBackend.flush();
    $scope.elements = [
      {
      value: 'apple'
      }
    ]
    assert.equal($scope.querySearch('a')[0].value, 'apple')
    assert.equal($scope.querySearch('p')[0], undefined )
  )
  it('booleanFn', ->
    state = {
      value: "This is a Test"
    }
    lowercaseQuery1 = "is"
    assert.equal(booleanFn(state, lowercaseQuery1), false)
    lowercaseQuery2 = "This"
    assert.equal(booleanFn(state, lowercaseQuery2), true)
  )
  it('loadAll', ->
    $scope = {}
    this.$controller('SearchCtrl', {$scope: $scope})
    this.$httpBackend.flush();
    this.$httpBackend.expectGET('/elementitems/all/')
    loadAll(this.$http, $scope)
    this.$httpBackend.flush();
    assert.equal($scope.elements[0].value,'ag')
  )
  it('queryElementList', ->
    $scope = {}
    this.$controller('SearchCtrl', {$scope: $scope})
    this.$httpBackend.flush();
    item = {display:'Ag'}
    this.$httpBackend.expectGET('/elementlistitems/Ag/')
    $scope.selectedItemChange(item)
    this.$httpBackend.flush()
    assert.equal($scope.elementlist[0].title, 'peter')
  )
)
