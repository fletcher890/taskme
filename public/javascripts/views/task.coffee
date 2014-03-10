define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "text!templates/tasks/task.html"
  "handlebars"
], ($, _, Backbone, Vent, taskTemplate) ->

	task = Backbone.View.extend({

		tagName: 'li'
		className: 'list-group-item'

		template: Handlebars.compile(taskTemplate)


		render: ->
			@$el.html(@template(@model.toJSON()))
			@

	});

	return task