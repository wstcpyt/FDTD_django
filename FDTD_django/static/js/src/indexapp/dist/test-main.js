var allTestFiles=[],TEST_REGEXP=/(_spec|_test)\.js$/i;for(var file in window.__karma__.files)TEST_REGEXP.test(file)&&allTestFiles.push(file);require.config({baseUrl:"/base/src/indexapp",deps:allTestFiles,callback:window.__karma__.start,paths:{domReady:"../../lib/requirejs-domready/domReady",angular:["https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min","../../lib/angular/angular.min"],ngAnimate:"../../lib/angular-animate/angular-animate.min",ngAria:"../../lib/angular-aria/angular-aria.min",ngMaterial:"../../lib/angular-material/angular-material.min",angularMocks:"../../lib/angular-mocks/angular-mocks",highlightjs:["//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.3/highlight.min.js","../../lib/highlightjs/highlight.pack"],angularHighlightjs:["http://pc035860.github.io/angular-highlightjs/angular-highlightjs.min","../../lib/angular-highlightjs/angular-highlightjs.min"],Bootstrap:["../../lib/bootstrap/dist/js/bootstrap.min","https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"],angularRoute:"../../lib/angular-route/angular-route.min"},shim:{angular:{exports:"angular"},ngAnimate:{exports:"ngAnimate",deps:["angular"]},ngAria:{exports:"ngAria",deps:["angular"]},ngMaterial:{exports:"ngMaterial",deps:["angular","ngAnimate","ngAria"]},angularMocks:{deps:["angular"],exports:"angular.mock"},angularHighlightjs:{deps:["angular","highlightjs"]},angularRoute:{exports:"angularRoute",deps:["angular"]}}});