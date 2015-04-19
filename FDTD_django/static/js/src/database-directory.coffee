app = angular.module('refractiveIndexApp', [])
app.controller('RefractiveIndexController',
  ($scope)->
    $scope.candisplay = false
    $scope.nextdisabled = true
    $scope.chemelement = [{title: 'NO DATA'}]
    $scope.nextclickHandler = ->
      $scope.candisplay = true

)

app.directive('changedHandler', ($http) ->
  return {
  restrict: 'A'
  link: ($scope, element, attrs) ->
    element.on('selectedtext-changed', ->
      if this.selected != undefined or attrs.unitest=='1'
        buttonChangedEvent = new ButtonChangedEvent(this, $http, $scope)
        buttonChangedEvent.updateChemelement()
        buttonChangedEvent.makenextbuttonavailable()
    )
  }
)

class ButtonChangedEvent
  constructor: (@_this, @_$http, @_$scope) ->
  makenextbuttonavailable: ->
    this._$scope.nextdisabled = false
  updateChemelement: ->
    _this_ = this
    this._$http.get('/elementlist/'+this._this.selectedtext).
    success((data) ->
      _this_._updateHandler(data)
    ).
    error( ->
      console.log('cannot retrieve element list')
    )
  _updateHandler: (data)->
    if data.length != 0
      this._$scope.chemelement = data

