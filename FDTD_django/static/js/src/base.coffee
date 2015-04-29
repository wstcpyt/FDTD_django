app = angular.module('FDTDapp', ['ngMaterial'])
app.controller('fdtdcontroller', ($scope)->
  tabvalue = $('#tabindex').val()
  tabvalue = parseInt(tabvalue)
  $scope.selectedIndex = tabvalue
  $scope.tab2clicked = ->
    window.location.href = "/databasedirectory/"
)