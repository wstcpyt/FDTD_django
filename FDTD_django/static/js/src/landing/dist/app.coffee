define([
    'angular',
    'ngMaterial',
    './controllers/index'
  ], (ng) ->
  'use strict'
  return ng.module('app', [
    'app.controllers',
    'ngMaterial'
  ])
)