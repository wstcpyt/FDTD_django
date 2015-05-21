define([
    'angular',
    'ngMaterial',
    'angularHighlightjs',
    './controllers/index',
  ], (ng) ->
  return ng.module('app', [
    'app.controllers',
    'ngMaterial',
    'hljs'
  ])
)