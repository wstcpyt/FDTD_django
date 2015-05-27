define(['./module'], (module) ->
  module.service('allmaterialService',['$http', ($http)->
    self = this
    self.items = []
    self.busy = false
    self.after =  0
    self.nextPage = ->
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
        self.items
    1
  ])
)