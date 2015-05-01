app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('SearchCtrl', ($scope, $log, $http)->
  $scope.elements = loadAll($http, $scope)

  $scope.querySearch = (query) ->
    $scope.elements.filter( createFilterFor(query) )

  $scope.selectedItemChange = (item) ->
    queryElementList($scope ,$http, item)
    $log.info('Item changed to ' + item.display)

  $scope.searchTextChange = (text) ->
    $log.info('Text changed to ' + text)
)

queryElementList = (_$scope,_$http, item)->
  _$http.get('/elementlistitems/' + item.display + '/').
  success((data) ->
    _$scope.elementlist = data
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
    $log.info('cannont retrieve element')
  )
@createFilterFor = (query) ->
  lowercaseQuery = angular.lowercase(query)
  return filterFn = (state) ->
    booleanFn(state, lowercaseQuery)

@booleanFn = (state, lowercaseQuery)->
  (state.value.indexOf(lowercaseQuery) == 0)