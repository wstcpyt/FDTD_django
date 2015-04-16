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
      document.querySelector('#categorydropdown').addEventListener('buttontext-changed',
        ->
          $scope.candisplay = true
      )
  ]
)

gem = false
