app = angular.module('FDTDapp', ['FDTDapp.appbase'])
app.controller('LeftCtrl', ($scope)->
  $scope.navmenus = [
    {
      'menu': 'REST API'
      'href': '#RESTAPI'
      'formatname': 'RESTAPI'
      'submenus': ['Getting Started', 'Quick Reference', 'Response Format']
    }
  ]
)
