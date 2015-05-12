app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('SearchCtrl', ($scope, $log, $http)->
  $scope.elements = loadAll($http, $scope)
  $scope.hideelementlist = false
  $scope.loadingchart = false
  $scope.querySearch = (query) ->
    results = if query then $scope.elements.filter( createFilterFor(query) ) else $scope.elements
    return results

  $scope.selectedItemChange = (item) ->
    if item != undefined
      $log.info('Item changed to ' + item.display)
      queryElementList($scope ,$http, item)

  $scope.searchTextChange = (text) ->
    $log.info('Text changed to ' + text)

  $scope.drawIndexChart = (item)->
    $("#chartframe").css({"width": "900px", "height": "500px", "margin-top" : "30px"})
    $("#linechart_material").css({"margin": "30px"})
    $scope.loadingchart = true
    drawchart = new DrawChart(item, $http, $scope)
    drawchart.drawIndexChart()
)

class @DrawChart
  constructor: (@item, @_$http, @_$scope)->
  drawIndexChart: ->
    self = this
    self._$http.get('/elementlistitemsdetail/'+ self.item.id + "/")
    .success((data) ->
        $("#chartframe").fadeIn()
        dataArray = self.gendataArrayfromRawData(data)
        self.drawGoogleChart(dataArray, data)
        self._$scope.loadingchart = false
    ).
    error(->
      console.log('cannot retrieve elementlist index data')
    )
  drawGoogleChart: (dataArray, JSONDATA)->
    drawChart(dataArray, JSONDATA)

  gendataArrayfromRawData: (data) ->
    dataArray = []
    for object in data["DATA"]["0"]["data"].split('\n')
      if object.split(' ').length > 1
        dataArray.push(object.split(' ').map(Number))
    return dataArray

queryElementList = (_$scope,_$http, item)->
  _$http.get('/elementlistitems/' + item.display + '/').
  success((data) ->
    _$scope.elementlist = data
    _$scope.hideelementlist = false
  ).
  error(->
    console.log('cannot retrieve element list')
  )


@loadAll = (_$http, _$scope)->
  _$http.get('/elementitems/all/').
  success((data) ->
    _$scope.elements = data.map((element)->
      return {
      value: element.title.toLowerCase(),
      display: element.title
      }
    )
  ).
  error(->
    console.log('cannont retrieve element')
  )
@createFilterFor = (query) ->
  lowercaseQuery = angular.lowercase(query)
  return filterFn = (state) ->
    booleanFn(state, lowercaseQuery)

@booleanFn = (state, lowercaseQuery)->
  (state.value.indexOf(lowercaseQuery) == 0)