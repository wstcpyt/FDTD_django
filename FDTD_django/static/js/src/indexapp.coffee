app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('SearchCtrl', ($scope, $log, $http)->
  $scope.elements = loadAll($http, $scope)
  $scope.hideelementlist = true
  $scope.querySearch = (query) ->
    results = if query then $scope.elements.filter( createFilterFor(query) ) else $scope.elements
    return results

  $scope.selectedItemChange = (item) ->
    if item != undefined
      $log.info('Item changed to ' + item.display)
      queryElementList($scope ,$http, item)

  $scope.searchTextChange = (text) ->
    $log.info('Text changed to ' + text)

  $scope.drawChart = (item)->
    console.log(item.id)
)

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