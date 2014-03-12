define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/header/header.html"
  "handlebars"
], ($, _, Backbone, headerTemplate, Handlebars) ->

	headerView = Backbone.View.extend({
		
		template: Handlebars.compile(headerTemplate)

		render: ->
			@$el.html(@template(@model.toJSON()))
			@

	});

	return headerView