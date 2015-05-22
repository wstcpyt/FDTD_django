define(['./module'], (module) ->
  module.controller('LeftCtrl',['$scope', '$location', '$rootScope', '$routeParams', ($scope, $location, $rootScope, $routeParams)->
    $scope.navmenus = [
      {
        'menu': 'REST API'
        'href': '#RESTAPI'
        'formatname': 'RESTAPI'
        'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
      },
      {
        'menu': 'RELEASE NOTE'
        'href': '#RELEASENOTE'
        'formatname': 'RELEASENOTE'
        'submenus': ['0.1.0']
      }
    ]
    $scope.selectsubmenu = (submenu, navmenu)->
      $rootScope.maintoolbartitle = submenu
      $scope.submenuselected = submenu
      $scope.menuselected = navmenu.menu
      $location.url('/'+navmenu.menu+'/'+submenu)
      $rootScope.$emit('submenuclicked')

    $scope.selectmenu = (navmenu) ->
      $scope.collapsemenuselected = navmenu.menu

    $scope.$on('$routeChangeSuccess', ->
      if $routeParams.menu && $routeParams.submenus
        $scope.collapsemenuselected = $routeParams.menu.replace('%20', ' ')
        $scope.menuselected = $scope.collapsemenuselected
        $scope.submenuselected = $routeParams.submenus.replace('%20', ' ')
        $rootScope.maintoolbartitle = $scope.submenuselected
      else
        $scope.collapsemenuselected = 'REST API'
        $scope.menuselected = $scope.collapsemenuselected
        $scope.submenuselected = 'Getting Started'
        $rootScope.maintoolbartitle = $scope.submenuselected

    )
  ])
)