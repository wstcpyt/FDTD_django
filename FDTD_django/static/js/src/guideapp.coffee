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
  $scope.submenuselected = -1
  $scope.selectsubmenu = (submenu, navmenu)->
    pageurl =  '/static/guidepage/' + submenu.replace(' ', '') + '.html'
    $scope.pageurl = pageurl
    $scope.submenuselected = submenu
    $scope.menuselected = navmenu.menu
    $location.url('/'+navmenu.menu+'/'+submenu)

  $scope.selectmenu = (navmenu) ->
    $scope.collapsemenuselected = navmenu.menu

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
  urlvariable = $location.url().split(/\s*\/\s*/g)
  if urlvariable.length == 3
    $scope.pageurl = '/static/guidepage/' + urlvariable[2].replace('%20', '') + '.html'
    $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ')
    $scope.menuselected = $scope.collapsemenuselected
    $scope.submenuselected = urlvariable[2].replace('%20', ' ')
)
app.controller('LeftCtrl', ($scope, $log, $http)->
)