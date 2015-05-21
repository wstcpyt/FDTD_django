define(['./module'], (module) ->
  controller = ($scope)->
    try
      tabvalue = $('#tabindex').val()
      tabvalue = parseInt(tabvalue)
    catch
      tabvalue = -1
    $scope.selectedIndex = tabvalue
    $scope.tab2clicked = ->
      window.location.href = "/databasedirectory/"
    $scope.tab1clicked = ->
      window.location.href = "/"
  module.controller('headercontroller',['$scope',controller])
  return controller
)