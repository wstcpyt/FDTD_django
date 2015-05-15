module = angular.module('indexapp.chart', [])
module.controller('chartCtrl', ($scope, $http)->
  $scope.drawIndexChart = (item)->
    $scope.paperselected = item.title
    drawchart = new DrawChart(item, $http, $scope)
    drawchart.drawIndexChart()
)

class @DrawChart
  constructor: (@item, @_$http, @_$scope)->
  drawIndexChart: ->
    self = this
    self._$http.get('/elementlistitemsdetail/'+ self.item.id + "/")
    .success((data) ->
        dataArray = self.gendataArrayfromRawData(data)
        self.drawGoogleChart(dataArray, data)
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