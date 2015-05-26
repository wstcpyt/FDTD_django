(function(){define(["angular","angularMocks","search/index"],function(){return describe("search",function(){return beforeEach(module("app.search")),beforeEach(inject(function(e,t,n){return this.$http=n,this.$controller=e,this.$httpBackend=t,this.$httpBackend.when("GET","/elementitems/all/").respond([{title:"Ag"},{title:"Ag3AsS3"}]),this.$httpBackend.when("GET","/elementlistitems/Ag/").respond([{title:"peter"},{title:"jack"}])})),afterEach(function(){return this.$httpBackend.verifyNoOutstandingExpectation(),this.$httpBackend.verifyNoOutstandingRequest()}),it("SearchCtrl",function(){var e,t;return e={},t=this.$controller("SearchCtrl",{$scope:e}),this.$httpBackend.expectGET("/elementitems/all/"),this.$httpBackend.flush(),e.elements=[{value:"apple"}],assert.equal(e.querySearch("a")[0].value,"apple"),assert.equal(e.querySearch("p")[0],void 0)}),it("booleanFn",function(){var e,t,n;return n={value:"This is a Test"},e="is",assert.equal(booleanFn(n,e),!1),t="This",assert.equal(booleanFn(n,t),!0)}),it("loadAll",function(){var e;return e={},this.$controller("SearchCtrl",{$scope:e}),this.$httpBackend.flush(),this.$httpBackend.expectGET("/elementitems/all/"),loadAll(this.$http,e),this.$httpBackend.flush(),assert.equal(e.elements[0].value,"ag")}),it("queryElementList",function(){var e,t;return e={},this.$controller("SearchCtrl",{$scope:e}),this.$httpBackend.flush(),t={display:"Ag"},this.$httpBackend.expectGET("/elementlistitems/Ag/"),e.selectedItemChange(t),this.$httpBackend.flush(),assert.equal(e.elementlist[0].title,"peter")})})})}).call(this);