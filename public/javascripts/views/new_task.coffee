define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/tasks/new_task.html"
], ($, _, Backbone, newTaskTemplate) ->

	newTaskView = Backbone.View.extend({
		initialize: ->
			console.log " in here"

		events: 
			'submit': 'saveProject'

		render: ->
			compiledTemplate = _.template( newTaskTemplate)
			@$el.html(compiledTemplate)
			@

		saveProject: (e) ->
			e.preventDefault()

	});

	return newTaskView
