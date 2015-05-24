define(['./module'], (module) ->
  module.service("indexdataService", ['$http', '$q', '$rootScope', ($http, $q, $rootScope)->
      self = this
      this.seturl = (url)->
        this.url = url
      this.getdata = ->

        deferred = $q.defer()
        $http.get(this.url)
        .success((data) ->
          dataArray = self.gendataArrayfromRawData(data)
          indexdata = {
            data: data,
            dataArray: dataArray
          }
          deferred.resolve(indexdata)
        ).
        error(->
          console.log('cannot retrieve elementlist index data')
        )
        deferred.promise.then((indexdata)->
          self.indexdata = indexdata
        )
        deferred.promise
      this.gendataArrayfromRawData = (data) ->
        dataArray = []
        for object in data["DATA"]["0"]["data"].split('\n')
          if object.split(' ').length > 1
            dataArray.push(object.split(' ').map(Number))
        return dataArray
      0
    ])
)