define(['./module'], (module) ->
  module.factory('Allmaterial',['$http', ($http)->
    class Allmaterial
      constructor: ->
        this.items = []
        this.busy = false
        this.after =  0
      nextPage: ->
        self = this
        if self.busy
        else
          self.busy = true
          url = "/allmaterial/" + this.after + "/10/"
          $http.get(url)
          .success((data)->
            for item in data
              self.items.push(item)
            self.after = self.items.length
            self.busy = false
          )
          .error(->
            console.log('cannot retrieve material inrange')
          )
        1
    Allmaterial
  ])
)