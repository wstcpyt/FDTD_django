app = angular.module('FDTDapp.appbase', ['ngMaterial', 'hljs'])
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
  $scope.selectsubmenu = (submenu, navmenu)->
    pageurl =  '/static/guidepage/' +navmenu.menu.replace(' ', '')+ submenu.replace(' ', '') + '.html'
    $scope.pageurl = pageurl
    $scope.submenuselected = submenu
    $scope.menuselected = navmenu.menu
    $location.url('/'+navmenu.menu+'/'+submenu)

  $scope.selectmenu = (navmenu) ->
    $scope.collapsemenuselected = navmenu.menu

  urlvariable = $location.url().split(/\s*\/\s*/g)
  if urlvariable.length == 3
    $scope.pageurl = '/static/guidepage/' +urlvariable[1].replace('%20', '')+ urlvariable[2].replace('%20', '') + '.html'
    $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ')
    $scope.menuselected = $scope.collapsemenuselected
    $scope.submenuselected = urlvariable[2].replace('%20', ' ')
  else
    urlvariable = '/REST%20API/Getting%20Started'.split(/\s*\/\s*/g)
    $scope.pageurl = '/static/guidepage/' +urlvariable[1].replace('%20', '')+ urlvariable[2].replace('%20', '') + '.html'
    $scope.collapsemenuselected = urlvariable[1].replace('%20', ' ')
    $scope.menuselected = $scope.collapsemenuselected
    $scope.submenuselected = urlvariable[2].replace('%20', ' ')
)
