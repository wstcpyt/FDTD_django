define(['./module'], (module) ->
  module.controller('releaseCtrl',['$scope', '$rootScope', 'releaseService', '$routeParams', ($scope, $rootScope, releaseService, $routeParams)->
    $scope.$on('$routeChangeSuccess', ->
      if $routeParams.menu == 'RELEASE NOTE'
        if releaseService.releaseversions
          filterjson = releaseService.releaseversions.filter((row)->
            if row.version == $routeParams.submenus
              true
            else
              false
          )
          $scope.releasenotes = filterjson[0]['releasenotes']
          $scope.releasedate = filterjson[0]['time']
        else
          promise = releaseService.getdata()
          promise.then((data)->
            filterjson = data.filter((row)->
              if row.version == $routeParams.submenus
                true
              else
                false
            )
            $scope.releasenotes = filterjson[0]['releasenotes']
          )
    )
  ])
)