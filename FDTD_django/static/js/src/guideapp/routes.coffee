define(['./app'], (app)->
  app.config(['$routeProvider', ($routeProvider)->
    $routeProvider
    .when('/', {
        templateUrl: '/static/html/guidepage/RESTAPI/GettingStarted.html',
      })
    .when('/:menu/:submenus',{
        templateUrl: (params)->
          if params.menu == "RELEASE NOTE"
            '/static/html/guidepage/RELEASENOTE/release.html'
          else
            '/static/html/guidepage/'+ params.menu.replace(' ', '') + '/' + params.submenus.replace(' ', '') + '.html'
      })
    .otherwise({
        redirectTo: '/'
      })
  ])
)