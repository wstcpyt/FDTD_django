require.config({
  # alias libraries paths
  baseUrl: '/static/js/src/landing/',
  paths: {
    domReady: '../../lib/requirejs-domready/domReady',
    angular: '../../lib/angular/angular.min',
    ngAnimate: '../../lib/angular-animate/angular-animate.min',
    ngAria: '../../lib/angular-aria/angular-aria.min',
    ngMaterial: '../../lib/angular-material/angular-material.min',
  },
  #angular does not support AMD out of the box, puth it in a shim
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
})
require(['bootstrap'], ->)