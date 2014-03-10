define [
  "backbone"
  "underscore"
], (Backbone, _) ->
  channel = _.extend({}, Backbone.Events)
  channel