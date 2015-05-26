define(['./module'], (module)->
  module.controller('LeftCtrl', ['$scope', '$rootScope', '$location', '$routeParams', ($scope, $rootScope, $location, $routeParams)->
      $scope.navmenus = [
        {
          'menu': 'SEARCH',
          'icon': '/static/images/icons/search.svg',
          'formatname': 'SEARCH',
          'class': 'deepblue',
        },
        {
          'menu': 'ALL MATERIALS',
          'icon': '/static/images/icons/language.svg',
          'formatname':'ALLMATERIALS',
          'class':'lightgrey',
        }
      ]
      $scope.$on('$routeChangeSuccess', ->
        if $routeParams.menu
          $scope.menuselected = $routeParams.menu.replace('%20', ' ')
          $rootScope.maintoolbartitle = $scope.menuselected
        else
          $scope.menuselected = "SEARCH"
          $rootScope.maintoolbartitle ='SEARCH'
      )
      $scope.selectmenu = (navmenu) ->
        $rootScope.maintoolbartitle = navmenu.menu
        $scope.menuselected = navmenu.menu
        $location.url('/' + navmenu.menu)
  ])
)