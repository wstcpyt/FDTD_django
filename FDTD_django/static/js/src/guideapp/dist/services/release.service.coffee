define(['./module'], (module) ->
  module.service("releaseService", ['$http', '$q',($http, $q)->
    self = this
    this.getdata = ->
      deferred = $q.defer()
      $http.get('/releaseversions/')
      .success((data) ->
        deferred.resolve(data)
      )
      .error(->
        console.log('cannot retrieve releaseversions data')
      )
      deferred.promise.then((data)->
        self.releaseversions = data
      )
      deferred.promise
    0
  ])
)