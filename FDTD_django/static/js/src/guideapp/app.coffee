define([
    'angular',
    'ngMaterial',
    'angularHighlightjs',
    './services/index',
    './controllers/index',
    'angularRoute'
  ], (ng) ->
  module = ng.module('app', [
    'ngRoute',
    'app.services',
    'app.controllers',
    'ngMaterial',
    'hljs'
  ])
  return module
)