module.exports = {
  verbose: true,
  suites:['static/js/src/fdtdonthecloud/**/test/'],
  root:'../../../..',
  plugins: {
    local: {
      browsers: ['chrome']
    }
  }
};