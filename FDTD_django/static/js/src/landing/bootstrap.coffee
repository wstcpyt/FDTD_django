define([
      'require',
      'angular',
      'app',
  ], (require, ng) ->
    'use strict'
    require(['domReady!'], (document)->
        ng.bootstrap(document, ['app'])
        $('.navbar-fixed-top').show()
    )
)