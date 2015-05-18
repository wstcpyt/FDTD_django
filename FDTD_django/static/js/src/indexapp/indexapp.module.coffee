module = angular.module('FDTDapp',
  ['ngMaterial', 'FDTDapp.sidenav', 'indexapp.search', 'indexapp.chart', 'indexapp.bottomsheetexport', 'indexdata.service'])
.config(['$mdIconProvider', ($mdIconProvider) ->
    $mdIconProvider
    .icon('txt', '/static/images/icons/txt.svg', 24)
    .icon('csv', '/static/images/icons/csv.svg', 24)
  ])
.run(['$http', '$templateCache', ($http, $templateCache) ->
    urls = [
      '/static/images/icons/txt.svg',
      '/static/images/icons/csv.svg',
    ]
    angular.forEach(urls, (url) ->
      $http.get(url, {cache: $templateCache})
    );
  ])