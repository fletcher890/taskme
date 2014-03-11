define [
  "jquery"
  "underscore"
  "backbone"
], ($, _, Backbone) ->

	task = Backbone.Model.extend({
		urlRoot: "/tasks"

		parse: (response) ->
			if typeof response is 'object'
				response.id = response._id.$oid
			else
				response = JSON.parse(response)
				console.log response
				response.id = response._id.$oid
			response

		defaults: {
		}

		initialize: ->
			@.cid = _.uniqueId('c')

		validate: (attrs, options) ->
			errors = {}
			unless attrs.name
				errors.name = ["Can't be blank"]
			unless attrs.importance 
				errors.importance = ["Can't be blank"]
				
			errors unless _.isEmpty errors

		reset: (opt) ->
		  @.clear(opt);
		  @.set(@.defaults);
	});

	return task
