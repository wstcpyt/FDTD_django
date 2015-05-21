define([
    'angular',
    'ngMaterial',
    './controllers/index'
  ], (ng) ->
  return ng.module('app', [
    'app.controllers',
    'ngMaterial'
  ])
)