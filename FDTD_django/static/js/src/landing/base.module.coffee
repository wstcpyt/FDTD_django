app = angular.module('FDTDapp', ['ngMaterial', 'head.ctrl'])
app.controller('headercontroller', ($scope)->
  tabvalue = $('#tabindex').val()
  tabvalue = parseInt(tabvalue)
  $scope.selectedIndex = tabvalue
  $scope.tab2clicked = ->
    window.location.href = "/databasedirectory/"
  $scope.tab1clicked = ->
    window.location.href = "/"
)