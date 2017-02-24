exports.config = {
  // See http://brunch.io/#documentation for docs.
    server: {
      port: 4000
    },
    files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["src/static/css/app.scss"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(src\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "src/static",
      "test",
      "src"
    ],

    // Where to compile files to
    public: "dist"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/src\/static\/vendor/]
    },
    elmBrunch: {
            // Set to path where `elm-make` is located, relative to `elmFolder`
            // (optional)
            // executablePath: './node_modules/elm/binwrappers',

            // Set to path where elm-package.json is located, defaults to project root
            // (optional)
            elmFolder: ".",

            // Set to the elm file(s) containing your "main" function
            // `elm make` handles all elm dependencies (required)
            // relative to `elmFolder`
            mainModules: [
                    'src/Main.elm'
            ],

            // Defaults to 'js/' folder in paths.public (optional)
            // However for phoenix we want it to be combined with the app.js file so do:
            outputFolder: "src/static/js",

            // If specified, all mainModules will be compiled to a single file
            // (optional and merged with outputFolder)
            // This is likely what we want to do with Phoenix for web efficiency
            outputFile: "elm.js",

            // optional: add some parameters that are passed to elm-make
            // "--warn" reports on important warnings so they do not go invisible,
            // I always recommend it.
            makeParameters: [
                    "--warn"
            ]
    },
    sass: {
      options: {
        includePaths: ["src/static/bootstrap/scss"],
        precision: 8,
        allowCache: true,
        modules: true
      }
    }

    /*,
    sass:{
      mode: "native",
      options: includePaths: ["node_modules"]
    }*/

  },

  modules: {
    autoRequire: {
      "js/app.js": ["src/static/js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
