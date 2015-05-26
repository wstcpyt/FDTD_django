define([
    'angular',
    'ngMaterial',
    './chart/index',
    './search/index',
    './sidenav/index',
    './exportdata/index',
    './common/index',
    './leftmenu/index',
    'angularRoute'
  ], (ng) ->
  module = ng.module('app', [
    'ngRoute',
    'ngMaterial',
    'app.chart',
    'app.search',
    'app.sidenav',
    'app.exportdata',
    'app.common',
    'app.leftmenu',
  ])
  return module
)