define([
    'angular',
    'ngMaterial',
    'angularHighlightjs',
    './controllers/index',
    'angularRoute'
  ], (ng) ->
  module = ng.module('app', [
    'ngRoute',
    'app.controllers',
    'ngMaterial',
    'hljs'
  ])
  return module
)