var jam = {
    "packages": [
        {
            "name": "backbone",
            "location": "public/javascripts/vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "public/javascripts/vendor/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "public/javascripts/vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "sinon",
            "location": "public/javascripts/vendor/sinon",
            "main": "sinon.js"
        },
        {
            "name": "underscore",
            "location": "public/javascripts/vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "version": "0.2.17",
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "sinon": {
            "exports": "sinon"
        },
        "underscore": {
            "exports": "_"
        }
    }
};

if (typeof require !== "undefined" && require.config) {
    require.config({
    "packages": [
        {
            "name": "backbone",
            "location": "public/javascripts/vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "public/javascripts/vendor/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "public/javascripts/vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "sinon",
            "location": "public/javascripts/vendor/sinon",
            "main": "sinon.js"
        },
        {
            "name": "underscore",
            "location": "public/javascripts/vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "sinon": {
            "exports": "sinon"
        },
        "underscore": {
            "exports": "_"
        }
    }
});
}
else {
    var require = {
    "packages": [
        {
            "name": "backbone",
            "location": "public/javascripts/vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "public/javascripts/vendor/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "public/javascripts/vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "sinon",
            "location": "public/javascripts/vendor/sinon",
            "main": "sinon.js"
        },
        {
            "name": "underscore",
            "location": "public/javascripts/vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "sinon": {
            "exports": "sinon"
        },
        "underscore": {
            "exports": "_"
        }
    }
};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}