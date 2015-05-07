describe('Unit Test SearchCtrl', ->
  root = exports ? this
  beforeEach(module('material.components.slider'));
  beforeEach(module('FDTDapp'))
  beforeEach(inject((_$controller_, _$httpBackend_, _$http_)->
    this.$http = _$http_
    this.$controller = _$controller_
    this.$httpBackend = _$httpBackend_
    this.data = {"DATA":[{"type":"tabulated nk","data":"0.2066 0.5 0.870386410508\n0.21089508319 0.5 0.965578874806\n"}]}
    this.data_others = {"DATA":[{"type":"others"}]}
    this.item = {
      id:1
    }
    this.item_others = {
      id:2
    }
    this.$httpBackend.when('GET', '/elementitems/all/').respond([{"title":"Ag"},{"title":"Ag3AsS3"}])
    this.$httpBackend.when('GET', '/elementlistitems/Ag/').respond([{"title":"peter"},{"title":"jack"}])
    this.$httpBackend.when('GET', '/elementlistitemsdetail/1/').respond(this.data)
    this.$httpBackend.when('GET', '/elementlistitemsdetail/2/').respond(this.data_others)
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
  it('drawIndexChart_tabulated_nk', ->
    $scope = {}
    this.$controller('SearchCtrl', {$scope: $scope})
    this.$httpBackend.flush()
    drawChart = new DrawChart(this.item, this.$http, $scope)
    mock = sinon.mock(drawChart)
    mock.expects('drawGoogleChart').once().returns(1)
    this.$httpBackend.expectGET('/elementlistitemsdetail/1/')
    drawChart.drawIndexChart()
    this.$httpBackend.flush()
    mock.verify()
    mock.restore()
  )
  it('drawIndexChart_others', ->
    $scope = {}
    this.$controller('SearchCtrl', {$scope: $scope})
    this.$httpBackend.flush()
    drawChart = new DrawChart(this.item_others, this.$http, $scope)
    mock = sinon.mock(drawChart)
    mock.expects('drawGoogleChart').never()
    this.$httpBackend.expectGET('/elementlistitemsdetail/2/')
    drawChart.drawIndexChart()
    this.$httpBackend.flush()
    mock.verify()
    mock.restore()
  )
  it('gendataArrayfromRawData', ->
    drawChart = new DrawChart(this.item, this.$http)
    result = drawChart.gendataArrayfromRawData(this.data)
    assert.equal(result.length, 2)
    assert.equal(result[0][0], 0.2066)
    assert.equal(result[1][0], 0.21089508319)
  )
)
