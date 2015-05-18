require.config({
  // alias libraries paths
  path: {
    'domReady': '/static/bower_components/requirejs-domready/domReady.js',
    'angular': '/static/bower_components/angular/angular.js'
  },

  //angular does not support AMD out of the box, puth it in a shim
  shim: {
    'angular': {
      exports: 'angular'
    }
  },

  //kick start application
  deps: ['/static/js/src/landing/bootstrap.js']
});