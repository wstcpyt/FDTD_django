(function(){define("controllers/module",["angular"],function(e){var t;return t=e.module("app.controllers",[]),t})}).call(this),function(){define("controllers/head.ctrl",["./module"],function(e){return e.controller("headercontroller",["$rootScope",function(e){return e.navitems=[{menu:"FDTD",url:"/"},{menu:"Index",url:"/databasedirectory/"},{menu:"Guide",url:"/guide/"}],e.navselected="FDTD"}])})}.call(this),function(){define("controllers/index",["./head.ctrl"],function(){})}.call(this),function(){define("app",["angular","ngMaterial","./controllers/index"],function(e){var t;return t=e.module("app",["app.controllers","ngMaterial"]),t})}.call(this),function(){define("bootstrap",["require","angular","app"],function(e,t){"use strict";return e(["domReady!"],function(e){return t.bootstrap(e,["app"])})})}.call(this),require.config({baseUrl:"/static/js/src/landing/",paths:{domReady:"../../lib/requirejs-domready/domReady",angular:["https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min","../../lib/angular/angular.min"],ngAnimate:"../../lib/angular-animate/angular-animate.min",ngAria:"../../lib/angular-aria/angular-aria.min",ngMaterial:"../../lib/angular-material/angular-material.min"},shim:{angular:{exports:"angular"},ngAnimate:{exports:"ngAnimate",deps:["angular"]},ngAria:{exports:"ngAria",deps:["angular"]},ngMaterial:{exports:"ngMaterial",deps:["angular","ngAnimate","ngAria"]}}}),require(["bootstrap"],function(){}),define("main",function(){});