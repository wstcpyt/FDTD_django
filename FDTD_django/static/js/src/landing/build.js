({
    paths: {
        domReady: '../../lib/requirejs-domready/domReady',
        angular: '../../lib/angular/angular.min',
        ngAnimate: '../../lib/angular-animate/angular-animate.min',
        ngAria: '../../lib/angular-aria/angular-aria.min',
        ngMaterial: '../../lib/angular-material/angular-material.min'
    },
    shim: {
        angular: {
            exports: 'angular'
        },
        ngAnimate: {
            exports: 'ngAnimate',
            deps: ['angular']
        },
        ngAria: {
            exports: 'ngAria',
            deps: ['angular']
        },
        ngMaterial: {
            exports: 'ngMaterial',
            deps: ['angular', 'ngAnimate', 'ngAria']
        }
    },
    baseUrl: '.',
    name: "main",
    out: "main.min.js",
    removeCombined: true,
    findNestedDependencies: true
})