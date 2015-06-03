define([
    'angular',
    'angularRoute',
    './leftmenu/index'
  ], (ng) ->
  module = ng.module('app', [
    'ngRoute',
    'app.leftmenu',
  ])
  return module
)