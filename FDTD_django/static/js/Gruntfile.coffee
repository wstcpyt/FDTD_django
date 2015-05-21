module.exports = (grunt)->
  grunt.initConfig({
# This is the name of the task
    requirejs:{
      landing: {
        options:{
          appDir: 'src/landing/'
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
      }
      guideapp:{
        options:{
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
      }
      indexapp:{
        options:{
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
              angular: 'empty:'
          }
        }
      }
    }
    karma:{
      unit:{
        configFile: 'src/landing/karm.conf.require.js'
      }
    }
  })
  grunt.loadNpmTasks('grunt-contrib-requirejs')
  grunt.loadNpmTasks('grunt-karma')