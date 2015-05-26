define(['./app'], (app)->
  app.config(['$routeProvider', ($routeProvider)->
    $routeProvider
    .when('/', {
        templateUrl: '/static/html/indexapp/SEARCH.html',
      })
    .when('/:menu',{
        templateUrl: (params)->
          '/static/html/indexapp/' +params.menu.replace(' ', '') + '.html'
      })
    .otherwise({
        redirectTo: '/'
      })
  ])
)