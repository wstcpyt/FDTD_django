angular.module('myApp', [])

angular.module('myApp').factory('Person', ->
  Person = (name)->
    this.name = name
)