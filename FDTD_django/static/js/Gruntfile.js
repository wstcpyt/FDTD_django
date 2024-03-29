// Generated by CoffeeScript 1.9.2
(function() {
  module.exports = function(grunt) {
    grunt.initConfig({
      requirejs: {
        landing: {
          options: {
            appDir: 'src/landing/',
            baseUrl: '.',
            mainConfigFile: "src/landing/main.js",
            removeCombined: true,
            findNestedDependencies: true,
            dir: "src/landing/dist",
            modules: [
              {
                name: 'main',
                exclude: ["infrastructure"]
              }, {
                name: "infrastructure"
              }
            ],
            paths: {
              angular: 'empty:'
            }
          }
        },
        guideapp: {
          options: {
            baseUrl: 'src/guideapp/',
            mainConfigFile: "src/guideapp/main.js",
            removeCombined: true,
            findNestedDependencies: true,
            dir: "src/guideapp/dist",
            modules: [
              {
                name: 'main',
                exclude: ["infrastructure"]
              }, {
                name: "infrastructure"
              }
            ],
            paths: {
              angular: 'empty:',
              highlightjs: 'empty:',
              angularHighlightjs: 'empty:'
            }
          }
        },
        indexapp: {
          options: {
            baseUrl: 'src/indexapp/',
            mainConfigFile: "src/indexapp/main.js",
            removeCombined: true,
            findNestedDependencies: true,
            dir: "src/indexapp/dist",
            modules: [
              {
                name: 'main',
                exclude: ["infrastructure"]
              }, {
                name: "infrastructure"
              }
            ],
            paths: {
              angular: 'empty:',
              Bootstrap: 'empty:',
              jquery: 'empty:'
            }
          }
        }
      },
      karma: {
        landing: {
          configFile: 'src/landing/karma.conf.js'
        },
        guideapp: {
          configFile: 'src/guideapp/karma.conf.js'
        },
        indexapp: {
          configFile: 'src/indexapp/karma.conf.js'
        }
      }
    });
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    return grunt.loadNpmTasks('grunt-karma');
  };

}).call(this);

//# sourceMappingURL=Gruntfile.js.map
