define([
    'require',
    'angular',
    'Bootstrap',
    'app',
  ], (require, ng) ->
  'use strict'
  require(['domReady!'], (document)->
    ng.bootstrap(document, ['app'])
  )
)