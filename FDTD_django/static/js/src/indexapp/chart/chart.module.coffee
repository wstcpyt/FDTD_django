module = angular.module('indexapp.chart', [])
module.controller('chartCtrl', ['$scope','$http','indexdataService' , ($scope, $http, indexdataService)->
  $scope.drawIndexChart = (item)->
    indexdataService.seturl('/elementlistitemsdetail/'+ item.id + "/")
    indexpromise = indexdataService.getdata()
    indexpromise.then((indexdata)->
      drawChart(indexdata.dataArray, indexdata.data)
    )
    $scope.paperselected = item.title
])