app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('GuideCtrl', ($scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia)->
  buildToggler= (navID)->
    debounceFn = $mdUtil.debounce(->
      $mdSidenav(navID)
        .toggle()
        .then(->
          $log.debug("toggle" + navID)
      )
    , 300)
    return debounceFn
  $scope.toggleLeft = buildToggler('left')
  $scope.screenIsgtmd = $mdMedia('gt-md')
  $scope.$watch(->
    $mdMedia('gt-md')
  , ->
    $scope.screenIsgtmd = $mdMedia('gt-md')
  )
)
app.controller('LeftCtrl', ($scope, $log, $http)->
)