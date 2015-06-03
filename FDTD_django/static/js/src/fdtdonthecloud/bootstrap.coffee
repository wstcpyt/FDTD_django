define([
    'require',
    'angular',
    'app',
    'config'
  ], (require, ng) ->
  'use strict'
  require(['domReady!'], (document)->
    ng.bootstrap(document, ['app'])
  )
)