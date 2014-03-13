define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/header/header.haml"
  "handlebars"
], ($, _, Backbone, headerTemplate, Handlebars) ->

	headerView = Backbone.View.extend({
		
		template: Handlebars.compile(headerTemplate)

		render: ->
			@$el.html(@template({title: "Taskme"}))
			@

	});

	return headerView