module.exports = {
  suites:['static/js/src/fdtdonthecloud/**/test/'],
  root:'../../../..',
  plugins: {
    local: {
      browsers: ['chrome']
    }
  }
};