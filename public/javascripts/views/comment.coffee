define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/partials/comment.haml"
  "handlebars"
], ($, _, Backbone, commentTemplate, Handlebars) ->

	comment = Backbone.View.extend({

		template: Handlebars.compile(commentTemplate)
		
		initialize: ->
			@render()


		render: ->
			@$el.html(@template({comment: @options.comment}))
			@

	});

	return comment