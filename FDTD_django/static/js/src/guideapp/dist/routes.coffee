define(['./app'], (app)->
  app.config(['$routeProvider', ($routeProvider)->
    $routeProvider
    .when('/', {
        templateUrl: '/static/guidepage/RESTAPI/GettingStarted.html',
      })
    .when('/:menu/:submenus',{
        templateUrl: (params)->
          '/static/guidepage/'+ params.menu.replace(' ', '') + '/' + params.submenus.replace(' ', '') + '.html'
        controller: 'releaseCtrl',
      })
    .otherwise({
        redirectTo: '/'
      })
  ])
)