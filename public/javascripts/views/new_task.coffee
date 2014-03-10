define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/tasks/new_task.html"
], ($, _, Backbone, newTaskTemplate) ->

	newTaskView = Backbone.View.extend({
		initialize: ->
			@model.fetch() unless @model.isNew()

		events: 
			'submit': 'saveProject'

		render: ->
			compiledTemplate = _.template( newTaskTemplate)
			@$el.html(compiledTemplate)
			@

		saveProject: (e) ->
			e.preventDefault()
			@model.set name: @$("#name").val()
			@model.set comment: @$("#comment").val()
			@model.save()

	});

	return newTaskView
