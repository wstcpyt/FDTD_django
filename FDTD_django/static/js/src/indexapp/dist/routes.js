// Generated by CoffeeScript 1.9.2
(function() {
  define(['./app'], function(app) {
    return app.config([
      '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/', {
          templateUrl: '/static/html/indexapp/search.html'
        }).otherwise({
          redirectTo: '/'
        });
      }
    ]);
  });

}).call(this);

//# sourceMappingURL=routes.js.map
