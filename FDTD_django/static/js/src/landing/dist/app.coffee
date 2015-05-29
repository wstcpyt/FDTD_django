define([
    'angular',
    'ngMaterial',
    './controllers/index'
  ], (ng) ->
  module = ng.module('app', [
    'app.controllers',
    'ngMaterial'
  ])
  return module
)