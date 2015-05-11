app = angular.module('FDTDapp', ['ngMaterial', 'hljs'])
app.controller('GuideCtrl', ($scope, $timeout, $mdSidenav, $mdUtil, $log, $mdMedia, $location)->
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
  $scope.pageurl = ''
  $scope.submenuselected = -1
  $scope.loadpage = (submenu, navmenu, index)->
    pageurl =  '/static/guidepage/' + submenu.replace(' ', '') + '.html'
    $scope.pageurl = pageurl
    $scope.submenuselected = index;
    $scope.menuselected = navmenu.menu
  $scope.selectmenu = (index) ->
    $scope.menuselectedindex = index

  $scope.navmenus = [
    {
      'menu': 'REST API'
      'href': '#RESTAPI'
      'formatname': 'RESTAPI'
      'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
    },
    {
      'menu': 'DATABASE'
      'href': '#DATABASE'
      'formatname': 'DATABASE'
      'submenus': ['Getting Started', 'DATABASE']
    }
  ]
  console.log($location.url())
)
app.controller('LeftCtrl', ($scope, $log, $http)->
)