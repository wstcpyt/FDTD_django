app = angular.module('refractiveIndexApp', [])
app.controller('RefractiveIndexController',
  ['$scope',
    ($scope)->
      $scope.candisplay = false
      $scope.chemelement = [
        {name:'Ag'},
        {name:'Cu'},
        {name:'Au'}
      ]
      console.log(document.querySelector('#categorydropdown').selected)
      document.querySelector('#categorydropdown').addEventListener('buttontext-changed',
        ->
          if this.selected != undefined
            console.log(this.selected)
            $scope.candisplay = true
      )
  ]
)

gem = false
