require.config
  paths:
    jquery: "vendor/jquery/dist/jquery"
    underscore: "vendor/underscore/underscore"
    backbone: "vendor/backbone/backbone"

require ["app", 'general/ux'], (App, Ux) ->
  
  App.initialize()
  return
