define(['./app'], (app)->
  app.config(['$routeProvider', ($routeProvider)->
    $routeProvider
    .when('/', {
        templateUrl: '/static/html/indexapp/search.html',
      })
    .otherwise({
        redirectTo: '/'
      })
  ])
)