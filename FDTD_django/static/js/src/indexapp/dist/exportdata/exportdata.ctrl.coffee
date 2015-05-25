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
      0
    ])
  module.controller('bottomCtrl',
    ['$scope', '$timeout', '$mdBottomSheet', 'generateCSVfileService','indexdataService', 'generateTXTfileService', 'generateJSONfileService',
      ($scope, $timeout, $mdBottomSheet, generateCSVfileService, indexdataService, generateTXTfileService, generateJSONfileService) ->
        $scope.showGridBottomSheet = ($event) ->
          $mdBottomSheet.show({
            templateUrl: '/static/html/bottom-sheet-grid-template.html',
            controller: 'GridBottomSheetCtrl',
            targetEvent: $event
          }).then((clickedItem) ->
            if clickedItem.name == 'CSV'
              dataarray = indexdataService.indexdata.dataArray
              generateCSVfileService.generateCSV(dataarray)
              generateCSVfileService.downloadCSV()
            if clickedItem.name == 'TXT'
              dataarray = indexdataService.indexdata.dataArray
              generateTXTfileService.generateTXT(dataarray)
              generateTXTfileService.downloadTXT()
            if clickedItem.name == 'JSONstring'
              jsonobject = indexdataService.indexdata.data
              generateJSONfileService.generateJSON(jsonobject)
              generateJSONfileService.downloadJSON()
          )
    ])
  module.controller('GridBottomSheetCtrl', ['$scope', '$mdBottomSheet', ($scope, $mdBottomSheet) ->
      $scope.items = [
        {name: 'TXT', icon: 'txt'},
        {name: 'CSV', icon: 'csv'},
        {name: 'JSONstring', icon: 'txt'},
      ]
      $scope.listItemClick = ($index) ->
        clickedItem = $scope.items[$index]
        $mdBottomSheet.hide(clickedItem)
    ])
)