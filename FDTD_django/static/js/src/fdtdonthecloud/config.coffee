define(['./app'], (app)->
  app.config(['$interpolateProvider', ($interpolateProvider)->
    $interpolateProvider.startSymbol('//')
    $interpolateProvider.endSymbol('//')
  ])
)