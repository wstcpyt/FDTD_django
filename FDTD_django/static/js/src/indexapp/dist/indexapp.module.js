(function(){var e;e=angular.module("FDTDapp",["ngMaterial","FDTDapp.sidenav","indexapp.search","indexapp.chart","indexapp.bottomsheetexport","indexdata.service"]).config(["$mdIconProvider",function(e){return e.icon("txt","/static/images/icons/txt.svg",24).icon("csv","/static/images/icons/csv.svg",24)}]).run(["$http","$templateCache",function(e,t){var n;return n=["/static/images/icons/txt.svg","/static/images/icons/csv.svg"],angular.forEach(n,function(n){return e.get(n,{cache:t})})}])}).call(this);