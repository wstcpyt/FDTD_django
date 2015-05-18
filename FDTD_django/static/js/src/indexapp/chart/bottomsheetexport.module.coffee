module = angular.module('indexapp.bottomsheetexport', [])
.controller('bottomCtrl', ['$scope','$timeout', '$mdBottomSheet', 'indexdataService', ($scope, $timeout, $mdBottomSheet, indexdataService) ->
    $scope.alert = ''
    $scope.showGridBottomSheet = ($event) ->
      $scope.alert = ''
      $mdBottomSheet.show({
        templateUrl: '/static/html/bottom-sheet-grid-template.html',
        controller: 'GridBottomSheetCtrl',
        targetEvent: $event
      }).then((clickedItem) ->
        $scope.alert = clickedItem.name + ' clicked!'
        test_array = [["name1", 2, 3], ["name2", 4, 5], ["name3", 6, 7], ["name4", 8, 9], ["name5", 10, 11]]
        csvContent = "data:text/csv;charset=utf-8,"
        test_array.forEach((infoArray) ->
          dataString = infoArray.join(",")
          csvContent += dataString + "\n";
        )
        encodedUri = encodeURI(csvContent)
        window.open(encodedUri)
        console.log(indexdataService.indexdata.dataArray)
      )
  ])
.controller('GridBottomSheetCtrl', ['$scope', '$mdBottomSheet', ($scope, $mdBottomSheet) ->
    $scope.items = [
      { name: 'TXT', icon: 'txt' },
      { name: 'CSV', icon: 'csv' },
    ]
    $scope.listItemClick = ($index) ->
      clickedItem = $scope.items[$index]
      $mdBottomSheet.hide(clickedItem)
  ])
