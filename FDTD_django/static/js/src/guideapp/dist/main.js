(function(){define("controllers/module",["angular"],function(e){var t;return t=e.module("app.controllers",[]),t})}).call(this),function(){define("controllers/left.ctrl",["./module"],function(e){return e.controller("LeftCtrl",["$scope","$location","$rootScope",function(e,t,n){var r;return e.navmenus=[{menu:"REST API",href:"#RESTAPI",formatname:"RESTAPI",submenus:["Getting Started","Quick Reference","Response Format"]},{menu:"RELEASE NOTE",href:"#RELEASENOTE",formatname:"RELEASENOTE",submenus:["0.1.0"]}],e.selectsubmenu=function(r,i){var s;return s="/static/guidepage/"+i.menu.replace(" ","")+r.replace(" ","")+".html",n.pageurl=s,n.maintoolbartitle=r,e.submenuselected=r,e.menuselected=i.menu,t.url("/"+i.menu+"/"+r),n.$emit("submenuclicked")},e.selectmenu=function(t){return e.collapsemenuselected=t.menu},r=t.url().split(/\s*\/\s*/g),r.length===3?(n.pageurl="/static/guidepage/"+r[1].replace("%20","")+r[2].replace("%20","")+".html",e.collapsemenuselected=r[1].replace("%20"," "),e.menuselected=e.collapsemenuselected,e.submenuselected=r[2].replace("%20"," "),n.maintoolbartitle=r[2].replace("%20"," ")):(r="/REST%20API/Getting%20Started".split(/\s*\/\s*/g),n.pageurl="/static/guidepage/"+r[1].replace("%20","")+r[2].replace("%20","")+".html",e.collapsemenuselected=r[1].replace("%20"," "),e.menuselected=e.collapsemenuselected,e.submenuselected=r[2].replace("%20"," "),n.maintoolbartitle=r[2].replace("%20"," "))}])})}.call(this),function(){define("controllers/sidenav.ctrl",["./module"],function(e){return e.controller("SidenavCtrl",["$rootScope","$scope","$timeout","$mdSidenav","$mdUtil","$log","$mdMedia",function(e,t,n,r,i,s,o){var u;return u=function(e){var t;return t=i.debounce(function(){return r(e).toggle().then(function(){return s.debug("toggle"+e)})},300),t},e.$on("submenuclicked",function(){return t.screenIsgtmd?s.debug("screen is gt-md"):r("left").close()}),t.toggleLeft=u("left"),t.screenIsgtmd=o("gt-md"),t.$watch(function(){return o("gt-md")},function(){return t.screenIsgtmd=o("gt-md")})}])})}.call(this),function(){define("controllers/index",["./left.ctrl","./sidenav.ctrl"],function(){})}.call(this),function(){define("app",["angular","ngMaterial","angularHighlightjs","./controllers/index"],function(e){return e.module("app",["app.controllers","ngMaterial","hljs"])})}.call(this),function(){define("bootstrap",["require","angular","app"],function(e,t){"use strict";return e(["domReady!"],function(e){return t.bootstrap(e,["app"])})})}.call(this),require.config({baseUrl:"/static/js/src/guideapp/",paths:{domReady:"../../lib/requirejs-domready/domReady",angular:["https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min","../../lib/angular/angular.min"],ngAnimate:"../../lib/angular-animate/angular-animate.min",ngAria:"../../lib/angular-aria/angular-aria.min",ngMaterial:"../../lib/angular-material/angular-material.min",highlightjs:["//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.3/highlight.min.js","../../lib/highlightjs/highlight.pack"],angularHighlightjs:["http://pc035860.github.io/angular-highlightjs/angular-highlightjs.min","../../lib/angular-highlightjs/angular-highlightjs.min"]},shim:{angular:{exports:"angular"},ngAnimate:{exports:"ngAnimate",deps:["angular"]},ngAria:{exports:"ngAria",deps:["angular"]},ngMaterial:{exports:"ngMaterial",deps:["angular","ngAnimate","ngAria"]},angularHighlightjs:{deps:["angular","highlightjs"]}}}),require(["bootstrap"],function(){}),define("main",function(){});