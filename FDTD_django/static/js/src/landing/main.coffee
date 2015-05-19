require.config({
  # alias libraries paths
  paths: {
    domReady: '/static/bower_components/requirejs-domready/domReady',
    angular: '/static/bower_components/angular/angular.min',
    ngAnimate: '/static/bower_components/angular-animate/angular-animate.min',
    ngAria: '/static/bower_components/angular-aria/angular-aria.min',
    ngMaterial: '/static/bower_components/angular-material/angular-material.min',
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

  #kick start application
  deps: ['/static/js/src/landing/bootstrap.js']
})