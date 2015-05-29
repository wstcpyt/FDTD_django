define(['./module'], (module) ->
  module.controller('headercontroller',['$rootScope',($rootScope)->
    $rootScope.navitems = [
      {
        'menu': 'FDTD'
        'url': '/'
      },
      {
        'menu': 'Index'
        'url': '/databasedirectory/'
      },
      {
        'menu': 'Guide'
        'url': '/guide/'
      }
    ]
    $rootScope.navselected = "FDTD"
  ])
)