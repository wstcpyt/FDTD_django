define([
    'angular',
    'ngMaterial',
    './chart/index',
    './search/index',
    './sidenav/index',
    './bottomsheetexport/index',
    './common/index',
  ], (ng) ->
  module = ng.module('app', [
    'ngMaterial',
    'app.chart',
    'app.search',
    'app.sidenav',
    'app.bottomsheetexport',
    'app.common',
  ])
  module.config(['$mdIconProvider', ($mdIconProvider) ->
    $mdIconProvider
    .icon('txt', '/static/images/icons/txt.svg', 24)
    .icon('csv', '/static/images/icons/csv.svg', 24)
  ])
  module.run(['$http', '$templateCache', ($http, $templateCache) ->
    urls = [
      '/static/images/icons/txt.svg',
      '/static/images/icons/csv.svg',
    ]
    angular.forEach(urls, (url) ->
      $http.get(url, {cache: $templateCache})
    );
  ])
  return module
)