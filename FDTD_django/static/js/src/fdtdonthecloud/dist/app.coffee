define([
    'angular',
    'angularRoute',
    './leftmenu/index'
  ], (ng) ->
  module = ng.module('app', [
    'ngRoute',
    'app.leftmenu',
  ])
  module.config(['$interpolateProvider', ($interpolateProvider)->
    $interpolateProvider.startSymbol('{$')
    $interpolateProvider.endSymbol('$}')
  ])
  return module
)