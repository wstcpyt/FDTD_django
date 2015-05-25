define(['./module'], (module) ->
  module.service("generateCSVfileService", [->
    self = this
    self.generateCSV = (dataarray)->
      self.csvContent = "data:text/csv;charset=utf-8,"
      if dataarray[0].length == 3
        self.csvContent += "wl,n,k" + "\n"
      else if dataarray[0].length == 2
        self.csvContent += "wl,n" + "\n"
      dataarray.forEach((infoArray) ->
        dataString = infoArray.join(",")
        self.csvContent += dataString + "\n";
      )
    self.downloadCSV = ->
      encodedUri = encodeURI(self.csvContent)
      window.open(encodedUri)
      return true
    0
  ])
  module.service("generateTXTfileService", [->
    self = this
    self.generateTXT = (dataarray)->
      self.txtContent = "data:text;charset=utf-8,"
      if dataarray[0].length == 3
        self.txtContent += "wl  n   k" + "\n"
      else if dataarray[0].length == 2
        self.txtContent += "wl  n" + "\n"
      dataarray.forEach((infoArray) ->
        dataString = infoArray.join("\t")
        self.txtContent += dataString + "\n";
      )
    self.downloadTXT = ->
      encodedUri = encodeURI(self.txtContent)
      window.open(encodedUri)
      return true
    0
  ])
  module.service("generateJSONfileService", [->
    self = this
    self.generateJSON = (jsonobject)->
      jsonstring = JSON.stringify(jsonobject)
      self.JSONContent = "data:text;charset=utf-8,"
      self.JSONContent += jsonstring
    self.downloadJSON = ->
      encodedUri = encodeURI(self.JSONContent)
      window.open(encodedUri)
      return true
    0
  ])
  module.controller('exportdataCtrl',
    ['$scope', 'generateCSVfileService','indexdataService', 'generateTXTfileService', 'generateJSONfileService',
      ($scope, generateCSVfileService, indexdataService, generateTXTfileService, generateJSONfileService) ->
        $scope.exportcsv = ->
          dataarray = indexdataService.indexdata.dataArray
          generateCSVfileService.generateCSV(dataarray)
          generateCSVfileService.downloadCSV()
        $scope.exporttxt = ->
          dataarray = indexdataService.indexdata.dataArray
          generateTXTfileService.generateTXT(dataarray)
          generateTXTfileService.downloadTXT()
        $scope.exportjson = ->
          jsonobject = indexdataService.indexdata.data
          generateJSONfileService.generateJSON(jsonobject)
          generateJSONfileService.downloadJSON()
    ])
)