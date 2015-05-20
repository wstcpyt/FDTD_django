define(['angular'], (ng) ->
  'use strict'
  module = ng.module('app.controllers', [])
  module.config([
    '$controllerProvider', ($controllerProvider) ->
      module.controller = $controllerProvider.register
  ])
  return module
)