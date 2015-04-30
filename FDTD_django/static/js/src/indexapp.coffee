app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('SearchCtrl', ($scope, $log)->
  $scope.states = loadAll()

  $scope.querySearch = (query) ->
    $scope.states.filter( createFilterFor(query) )

  $scope.selectedItemChange = (item) ->
    $log.info('Item changed to ' + JSON.stringify(item))

  $scope.searchTextChange = (text) ->
    $log.info('Text changed to ' + text)
)

@loadAll = ->
  allStates = 'Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware,
                Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana,
                Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana,
                Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina,
                North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina,
                South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia,
                Wisconsin, Wyoming'
  return allStates.split(/, +/g).map((state)->
    return {
      value: state.toLowerCase(),
      display: state
    }
  )

createFilterFor = (query) ->
  this.lowercaseQuery = angular.lowercase(query)
  return filterFn = (state) ->
    booleanFn(state)

booleanFn = (state)->
  (state.value.indexOf(this.lowercaseQuery) == 0)