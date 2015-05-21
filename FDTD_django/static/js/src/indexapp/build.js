({
    baseUrl: '.',
    mainConfigFile: "main.js",
    removeCombined: true,
    findNestedDependencies: true,
    dir: "dist",
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

})
