define([
    'angular',
    'ngMaterial',
    './chart/index',
    './search/index',
    './sidenav/index',
    './exportdata/index',
    './common/index',
  ], (ng) ->
  module = ng.module('app', [
    'ngMaterial',
    'app.chart',
    'app.search',
    'app.sidenav',
    'app.exportdata',
    'app.common',
  ])
  return module
)