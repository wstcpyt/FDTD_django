// Generated by CoffeeScript 1.9.2
(function() {
  var app, queryElementList;

  app = angular.module('FDTDapp', ['ngMaterial']);

  app.controller('SearchCtrl', function($scope, $log, $http) {
    $scope.elements = loadAll($http, $scope);
    $scope.hideelementlist = false;
    $scope.loadingchart = false;
    $scope.querySearch = function(query) {
      var results;
      results = query ? $scope.elements.filter(createFilterFor(query)) : $scope.elements;
      return results;
    };
    $scope.selectedItemChange = function(item) {
      if (item !== void 0) {
        $log.info('Item changed to ' + item.display);
        return queryElementList($scope, $http, item);
      }
    };
    $scope.searchTextChange = function(text) {
      return $log.info('Text changed to ' + text);
    };
    return $scope.drawIndexChart = function(item) {
      var drawchart;
      $scope.elementlist = [item];
      $("md-list-item").css({
        "backgroundColor": "rgb(238, 246, 255)"
      });
      $("#chartframe").css({
        "width": "900px",
        "height": "500px",
        "margin-top": "30px"
      });
      $("#linechart_material").css({
        "margin": "30px"
      });
      $scope.loadingchart = true;
      drawchart = new DrawChart(item, $http, $scope);
      return drawchart.drawIndexChart();
    };
  });

  this.DrawChart = (function() {
    function DrawChart(item1, _$http1, _$scope1) {
      this.item = item1;
      this._$http = _$http1;
      this._$scope = _$scope1;
    }

    DrawChart.prototype.drawIndexChart = function() {
      var self;
      self = this;
      return self._$http.get('/elementlistitemsdetail/' + self.item.id + "/").success(function(data) {
        var dataArray;
        if (data["DATA"]["0"]["type"] === "tabulated nk") {
          $("#chartframe").fadeIn();
          dataArray = self.gendataArrayfromRawData(data);
          self.drawGoogleChart(dataArray, data);
          return self._$scope.loadingchart = false;
        } else {
          return $("#chartframe").fadeOut();
        }
      }).error(function() {
        return console.log('cannot retrieve elementlist index data');
      });
    };

    DrawChart.prototype.drawGoogleChart = function(dataArray, JSONDATA) {
      return drawChart(dataArray, JSONDATA);
    };

    DrawChart.prototype.gendataArrayfromRawData = function(data) {
      var dataArray, i, len, object, ref;
      dataArray = [];
      ref = data["DATA"]["0"]["data"].split('\n');
      for (i = 0, len = ref.length; i < len; i++) {
        object = ref[i];
        if (object.split(' ').length === 3) {
          dataArray.push(object.split(' ').map(Number));
        }
      }
      return dataArray;
    };

    return DrawChart;

  })();

  queryElementList = function(_$scope, _$http, item) {
    return _$http.get('/elementlistitems/' + item.display + '/').success(function(data) {
      _$scope.elementlist = data;
      return _$scope.hideelementlist = false;
    }).error(function() {
      return console.log('cannot retrieve element list');
    });
  };

  this.loadAll = function(_$http, _$scope) {
    return _$http.get('/elementitems/all/').success(function(data) {
      return _$scope.elements = data.map(function(element) {
        return {
          value: element.title.toLowerCase(),
          display: element.title
        };
      });
    }).error(function() {
      return console.log('cannont retrieve element');
    });
  };

  this.createFilterFor = function(query) {
    var filterFn, lowercaseQuery;
    lowercaseQuery = angular.lowercase(query);
    return filterFn = function(state) {
      return booleanFn(state, lowercaseQuery);
    };
  };

  this.booleanFn = function(state, lowercaseQuery) {
    return state.value.indexOf(lowercaseQuery) === 0;
  };

}).call(this);

//# sourceMappingURL=indexapp.js.map