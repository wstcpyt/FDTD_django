define(['./module'], (module) ->
  module.controller('headercontroller',['$rootScope', '$scope',($rootScope, $scope)->
    $rootScope.navitems = [
      {
        'menu': 'Get Started'
        'id': 'id_get_started'
        'url': '/fdtdapp/'
      },
      {
        'menu': 'Guide & Resources'
        'id': 'id_guide'
        'url': '/guide/'
      }
    ]
    $rootScope.navselected = "FDTD"
    $scope.loginclick = (e)->
      button = e.target;
      while (!button.hasAttribute('data-dialog') && button != document.body)
        button = button.parentElement
      if !button.hasAttribute('data-dialog')
        return
      id = button.getAttribute('data-dialog')
      dialog = document.getElementById(id);
      if (dialog)
        dialog.open()
  ])
)