(function(){define("chart/module",["angular"],function(e){var t;return t=e.module("app.chart",[]),t})}).call(this),function(){define("chart/chart.ctrl",["./module"],function(e){return e.controller("chartCtrl",["$scope","$http","indexdataService",function(e,t,n){return e.drawIndexChart=function(t){var r;return n.seturl("/elementlistitemsdetail/"+t.id+"/"),r=n.getdata(),r.then(function(e){return drawChart(e.dataArray,e.data)}),e.paperselected=t.title}}])})}.call(this),function(){define("chart/index",["./chart.ctrl"],function(){})}.call(this),function(){define("search/module",["angular"],function(e){var t;return t=e.module("app.search",[]),t})}.call(this),function(){define("search/search.ctrl",["./module"],function(e){var t;return e.controller("SearchCtrl",["$scope","$log","$http",function(e,n,r){return e.elements=loadAll(r,e),e.hideelementlist=!1,e.querySearch=function(t){var n;return n=t?e.elements.filter(createFilterFor(t)):e.elements,n},e.selectedItemChange=function(i){if(i!==void 0)return n.info("Item changed to "+i.display),t(e,r,i)},e.searchTextChange=function(e){return n.info("Text changed to "+e)}}]),t=function(e,t,n){return t.get("/elementlistitems/"+n.display+"/").success(function(t){return e.elementlist=t,e.hideelementlist=!1}).error(function(){return console.log("cannot retrieve element list")})},this.loadAll=function(e,t){return e.get("/elementitems/all/").success(function(e){return t.elements=e.map(function(e){return{value:e.title.toLowerCase(),display:e.title}})}).error(function(){return console.log("cannont retrieve element")})},this.createFilterFor=function(e){var t,n;return n=angular.lowercase(e),t=function(e){return booleanFn(e,n)}},this.booleanFn=function(e,t){return e.value.indexOf(t)===0},e.controller("LeftCtrl",function(){})})}.call(this),function(){define("search/index",["./search.ctrl"],function(){})}.call(this),function(){define("sidenav/module",["angular"],function(e){var t;return t=e.module("app.sidenav",[]),t})}.call(this),function(){define("sidenav/sidenav.ctrl",["./module"],function(e){return e.controller("SidenavCtrl",["$scope","$timeout","$mdSidenav","$mdUtil","$log","$mdMedia",function(e,t,n,r,i,s){var o;return o=function(e){var t;return t=r.debounce(function(){return n(e).toggle().then(function(){return i.debug("toggle"+e)})},10),t},e.toggleLeft=o("left"),e.screenIsgtmd=s("gt-md"),e.$watch(function(){return s("gt-md")},function(){return e.screenIsgtmd=s("gt-md")})}])})}.call(this),function(){define("sidenav/index",["./sidenav.ctrl"],function(){})}.call(this),function(){define("exportdata/module",["angular"],function(e){var t;return t=e.module("app.exportdata",[]),t})}.call(this),function(){define("exportdata/exportdata.ctrl",["./module"],function(e){return e.service("generateCSVfileService",[function(){var e;return e=this,e.generateCSV=function(t){return e.csvContent="data:text/csv;charset=utf-8,",t[0].length===3?e.csvContent+="wl,n,k\n":t[0].length===2&&(e.csvContent+="wl,n\n"),t.forEach(function(t){var n;return n=t.join(","),e.csvContent+=n+"\n"})},e.downloadCSV=function(){var t;return t=encodeURI(e.csvContent),window.open(t),!0},0}]),e.service("generateTXTfileService",[function(){var e;return e=this,e.generateTXT=function(t){return e.txtContent="data:text;charset=utf-8,",t[0].length===3?e.txtContent+="wl  n   k\n":t[0].length===2&&(e.txtContent+="wl  n\n"),t.forEach(function(t){var n;return n=t.join("	"),e.txtContent+=n+"\n"})},e.downloadTXT=function(){var t;return t=encodeURI(e.txtContent),window.open(t),!0},0}]),e.service("generateJSONfileService",[function(){var e;return e=this,e.generateJSON=function(t){var n;return n=JSON.stringify(t),e.JSONContent="data:text;charset=utf-8,",e.JSONContent+=n},e.downloadJSON=function(){var t;return t=encodeURI(e.JSONContent),window.open(t),!0},0}]),e.controller("exportdataCtrl",["$scope","generateCSVfileService","indexdataService","generateTXTfileService","generateJSONfileService",function(e,t,n,r,i){return e.exportcsv=function(){var e;return e=n.indexdata.dataArray,t.generateCSV(e),t.downloadCSV()},e.exporttxt=function(){var e;return e=n.indexdata.dataArray,r.generateTXT(e),r.downloadTXT()},e.exportjson=function(){var e;return e=n.indexdata.data,i.generateJSON(e),i.downloadJSON()}}])})}.call(this),function(){define("exportdata/index",["./exportdata.ctrl"],function(){})}.call(this),function(){define("common/module",["angular"],function(e){var t;return t=e.module("app.common",[]),t})}.call(this),function(){define("common/indexdata.service",["./module"],function(e){return e.service("indexdataService",["$http","$q","$rootScope",function(e,t,n){var r;return r=this,this.seturl=function(e){return this.url=e},this.getdata=function(){var n;return n=t.defer(),e.get(this.url).success(function(e){var t,i;return t=r.gendataArrayfromRawData(e),i={data:e,dataArray:t},n.resolve(i)}).error(function(){return console.log("cannot retrieve elementlist index data")}),n.promise.then(function(e){return r.indexdata=e}),n.promise},this.gendataArrayfromRawData=function(e){var t,n,r,i,s;t=[],s=e.DATA[0].data.split("\n");for(n=0,r=s.length;n<r;n++)i=s[n],i.split(" ").length>1&&t.push(i.split(" ").map(Number));return t},0}])})}.call(this),function(){define("common/index",["./indexdata.service"],function(){})}.call(this),function(){define("leftmenu/module",["angular"],function(e){var t;return t=e.module("app.leftmenu",[]),t})}.call(this),function(){define("leftmenu/left.ctrl",["./module"],function(e){return e.controller("LeftCtrl",["$scope","$rootScope","$location","$routeParams",function(e,t,n,r){return e.navmenus=[{menu:"SEARCH",icon:"/static/images/icons/search.svg",formatname:"SEARCH","class":"deepblue"},{menu:"ALL MATERIALS",icon:"/static/images/icons/language.svg",formatname:"ALLMATERIALS","class":"lightgrey"}],e.$on("$routeChangeSuccess",function(){return r.menu?(e.menuselected=r.menu.replace("%20"," "),t.maintoolbartitle=e.menuselected):(e.menuselected="SEARCH",t.maintoolbartitle="SEARCH")}),e.selectmenu=function(r){return t.maintoolbartitle=r.menu,e.menuselected=r.menu,n.url("/"+r.menu)}}])})}.call(this),function(){define("leftmenu/index",["./left.ctrl"],function(){})}.call(this),function(){define("app",["angular","ngMaterial","./chart/index","./search/index","./sidenav/index","./exportdata/index","./common/index","./leftmenu/index","angularRoute"],function(e){var t;return t=e.module("app",["ngRoute","ngMaterial","app.chart","app.search","app.sidenav","app.exportdata","app.common","app.leftmenu"]),t})}.call(this),function(){define("routes",["./app"],function(e){return e.config(["$routeProvider",function(e){return e.when("/",{templateUrl:"/static/html/indexapp/SEARCH.html"}).when("/:menu",{templateUrl:function(e){return"/static/html/indexapp/"+e.menu.replace(" ","")+".html"}}).otherwise({redirectTo:"/"})}])})}.call(this),function(){define("bootstrap",["require","angular","Bootstrap","app","routes"],function(e,t){"use strict";return e(["domReady!"],function(e){return t.bootstrap(e,["app"])})})}.call(this),require.config({baseUrl:"/static/js/src/indexapp/",paths:{domReady:"../../lib/requirejs-domready/domReady",angular:["https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min","../../lib/angular/angular.min"],ngAnimate:"../../lib/angular-animate/angular-animate.min",ngAria:"../../lib/angular-aria/angular-aria.min",ngMaterial:"../../lib/angular-material/angular-material.min",Bootstrap:["../../lib/bootstrap/dist/js/bootstrap.min","https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"],angularRoute:"../../lib/angular-route/angular-route.min"},shim:{angular:{exports:"angular"},ngAnimate:{exports:"ngAnimate",deps:["angular"]},ngAria:{exports:"ngAria",deps:["angular"]},ngMaterial:{exports:"ngMaterial",deps:["angular","ngAnimate","ngAria"]},angularRoute:{exports:"angularRoute",deps:["angular"]}}}),require(["bootstrap"],function(){}),define("main",function(){});