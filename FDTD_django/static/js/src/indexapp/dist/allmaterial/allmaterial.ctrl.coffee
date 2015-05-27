define(['./module'], (module) ->
  module.controller('allmaterialCtrl', ['$scope', 'Allmaterial', ($scope, Allmaterial)->
    $scope.allmaterial = new Allmaterial()
  ])
)