define [
  "jquery"
  "underscore"
  "backbone"
], ($, _, Backbone) ->

	task = Backbone.Model.extend({
		urlRoot: "/tasks"

		initialize: ->

		validate: (attrs, options) ->
			errors = {}
			unless attrs.name
				errors.name = ["Can't be blank"]
			errors unless _.isEmpty errors
	});

	return task
