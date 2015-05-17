module = angular.module('indexapp.bottomsheetexport', [])
.config(($mdIconProvider) ->
    $mdIconProvider
      .icon('txt', '/static/images/icons/txt.svg', 24)
      .icon('csv', '/static/images/icons/csv.svg', 24)
  )
.controller('bottomCtrl', ($scope, $timeout, $mdBottomSheet) ->
  $scope.alert = ''
  $scope.showGridBottomSheet = ($event) ->
    $scope.alert = ''
    $mdBottomSheet.show({
      templateUrl: '/static/html/bottom-sheet-grid-template.html',
      controller: 'GridBottomSheetCtrl',
      targetEvent: $event
    }).then((clickedItem) ->
      console.log(clickedItem.name)
      $scope.alert = clickedItem.name + ' clicked!'
    )
)
.controller('GridBottomSheetCtrl', ($scope, $mdBottomSheet) ->
  $scope.items = [
    { name: 'TXT', icon: 'txt' },
    { name: 'CSV', icon: 'csv' },
  ]
  $scope.listItemClick = ($index) ->
    clickedItem = $scope.items[$index]
    $mdBottomSheet.hide(clickedItem)
)
.run(($http, $templateCache) ->
    urls = [
      '/static/images/icons/txt.svg',
      '/static/images/icons/csv.svg',
    ]
    angular.forEach(urls, (url) ->
      $http.get(url, {cache: $templateCache})
    );
  )