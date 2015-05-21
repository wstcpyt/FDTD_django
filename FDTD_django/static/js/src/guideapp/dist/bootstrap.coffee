define([
    'require',
    'angular',
    'app',
    'routes',
  ], (require, ng) ->
  'use strict'
  require(['domReady!'], (document)->
    ng.bootstrap(document, ['app'])
  )
)