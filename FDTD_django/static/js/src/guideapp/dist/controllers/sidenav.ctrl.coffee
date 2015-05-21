define(['./module'], (module) ->
  module.controller('SidenavCtrl',['$rootScope','$scope', '$timeout', '$mdSidenav', '$mdUtil', '$log', '$mdMedia',
    ($rootScope,$scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia)->
      buildToggler = (navID)->
        debounceFn = $mdUtil.debounce(->
          $mdSidenav(navID)
          .toggle()
          .then(->
            $log.debug("toggle" + navID)
          )
        , 300)
        return debounceFn
      $rootScope.$on('submenuclicked', ->
        if $scope.screenIsgtmd
          $log.debug('screen is gt-md')
        else
          $mdSidenav('left').close()
      )
      $scope.toggleLeft = buildToggler('left')
      $scope.screenIsgtmd = $mdMedia('gt-md')
      $scope.$watch(->
        $mdMedia('gt-md')
      , ->
        $scope.screenIsgtmd = $mdMedia('gt-md')
      )
  ])
)