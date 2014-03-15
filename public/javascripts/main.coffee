require.config
  paths:
    jquery: "vendor/jquery/dist/jquery"
    jqueryui: "http://code.jquery.com/ui/1.10.4/jquery-ui"
    underscore: "vendor/underscore/underscore"
    backbone: "vendor/backbone/backbone"
    handlebars: "vendor/handlebars/handlebars"
    vent: "vent"
    validatable: "mixins/validatable"
    
require ["app", 'general/ux', 'helpers/handlebars-helper'], (App, Ux) ->
  
  App.initialize()
  return
