fdtdcloudapp = angular.module('fdtdcloudapp', ['ngRoute'])
fdtdcloudapp.config(['$routeProvider', '$interpolateProvider',($routeProvider, $interpolateProvider)->
  $interpolateProvider.startSymbol('//')
  $interpolateProvider.endSymbol('//')
  $routeProvider
  .when('/', {
      templateUrl: '/static/js/src/fdtdonthecloud/main/new.html'
    })
  .when('/:menu/:index',{
      templateUrl: (params)->
        '/static/js/src/fdtdonthecloud/main/'+ params.menu.replace(' ', '') + '.html'
    })
])

fdtdcloudapp.controller('RouteCtrl',['$scope', '$routeParams', ($scope, $routeParams)->
  $scope.$on('$routeChangeSuccess', ->
    if $routeParams.menu && $routeParams.index
      $scope.selectedindex = $routeParams.index
    else
      $scope.selectedindex = 0
  )
])
