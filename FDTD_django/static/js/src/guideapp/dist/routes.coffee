define(['./app'], (app)->
  app.config(['$routeProvider', ($routeProvider)->
    $routeProvider.when('/view1', {
      templateUrl: '/static/guidepage/GettingStarted.html'
    })
  ])
)