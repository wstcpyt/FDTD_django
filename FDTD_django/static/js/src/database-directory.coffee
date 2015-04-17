app = angular.module('refractiveIndexApp', [])
app.controller('RefractiveIndexController',
    ($scope)->
      $scope.candisplay = false
      $scope.chemelement = [
        {name:'Ag'},
        {name:'Cu'},
        {name:'Au'}
      ]
)

app.directive('textChanged', ->
  return {
    restrict: 'A'
    link: ($scope, element, attrs) ->
      element.on('buttontext-changed', ->
        if this.selected != undefined or attrs.unitest=='1'
          $scope.candisplay = true
      )

  }


)