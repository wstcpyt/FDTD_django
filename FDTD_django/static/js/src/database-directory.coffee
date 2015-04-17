app = angular.module('refractiveIndexApp', [])
app.controller('RefractiveIndexController',
    ($scope)->
      $scope.candisplay = false
      $scope.chemelement = [
        {name:'Ag'},
        {name:'Cu'},
        {name:'Au'}
      ]
      $scope.peterdropdownClicked = ($event) ->
        angular.element($event.target).on('buttontext-changed', ->
           if this.selected != undefined
            console.log(this.selected)
            $scope.candisplay = true
        )
)

app.directive('textChanged', ->
  return {
    restrict: 'A'
    link: ($scope, element, attrs) ->
      element.on('buttontext-changed', ->
        if this.selected != undefined
          $scope.candisplay = true

      )

  }


)