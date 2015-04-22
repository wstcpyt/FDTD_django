app = angular.module('refractiveIndexApp', [])
app.controller('RefractiveIndexController',
  ($scope)->
    $scope.categorynextdisabled = true
    $scope.elementnextdisabled = true
    $scope.elementlistnextdisabled = true
    $scope.categorynextclickHandler = ->
      $scope.categorydisplay = false
      $scope.elementdisplay = true
    $scope.elementnextclickHandler = ->
      $scope.elementdisplay = false
      $scope.elementlistdisplay = true

    $scope.elementlistnextclickHandler = ->
      $scope.elementlistdisplay = false
      $scope.resultdisplay = true

)

app.directive('categoryChangedHandler', ($http) ->
  return {
  restrict: 'A'
  link: ($scope, element, attrs) ->
    element.on('selectedtext-changed', ->
      if this.selected != undefined or attrs.unitest == '1'
        categoryChangedEvent = new CategoryChangedEvent(this, $http, $scope)
        categoryChangedEvent.updateChemelement()
        $scope.$apply(categoryChangedEvent.makenextbuttonavailable())
    )
  }
)

class CategoryChangedEvent
  constructor: (@_this, @_$http, @_$scope) ->
  makenextbuttonavailable: ->
    this._$scope.categorynextdisabled = false
  updateChemelement: ->
    _this_ = this
    this._$http.get('/elementitems/' + this._this.selectedtext + '/').
    success((data) ->
      _this_._updateHandler(data)
    ).
    error(->
      console.log('cannot retrieve element list')
    )
  _updateHandler: (data)->
    this._$scope.chemelement = data

app.directive('elementChangedHandler', ($http) ->
  return {
  restrict: 'A'
  link: ($scope, element, attrs) ->
    element.on('selectedtext-changed', ->
      if this.selected != undefined or attrs.unitest == '1'
        elementChangedEvent = new ElementChangedEvent(this, $http, $scope)
        $scope.$apply(elementChangedEvent.makenextbuttonavailable())
        elementChangedEvent.updateChemelementlist()
    )
  }
)

class ElementChangedEvent
  constructor: (@_this, @_$http, @_$scope) ->
  makenextbuttonavailable: ->
    this._$scope.elementnextdisabled = false
  updateChemelementlist: ->
    _this_ = this
    this._$http.get('/elementlistitems/' + this._this.selectedtext + '/').
    success((data) ->
      _this_._updateHandler(data)
    ).
    error(->
      console.log('cannot retrieve element list')
    )
  _updateHandler: (data)->
    this._$scope.chemelementlist = data

app.directive('elementlistChangedHandler', ($http)->
  return {
  restrict: 'A'
  link: ($scope, element, attrs) ->
    element.on('selectedtext-changed', ->
      if this.selected != undefined or attrs.unitest == '1'
        elementlistChangedEvent = new ElementListChangedEvent(this, $http, $scope)
        $scope.$apply(elementlistChangedEvent.makenextbuttonavailable())
    )
  }
)

class ElementListChangedEvent
  constructor: (@_this, @_$http, @_$scope) ->
  makenextbuttonavailable: ->
    this._$scope.elementlistnextdisabled = false
