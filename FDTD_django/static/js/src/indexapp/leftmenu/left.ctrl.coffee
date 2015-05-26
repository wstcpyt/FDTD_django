define(['./module'], (module)->
  module.controller('LeftCtrl', ['$scope', ($scope)->
      $scope.navmenus = [
        {
          'menu': 'SEARCH',
          'icon': '/static/images/icons/search.svg',
          'formatname': 'SEARCH',
          'class': 'deepblue',
        }
      ]
  ])
)