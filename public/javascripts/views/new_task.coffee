define [
  "jquery"
  "underscore"
  "backbone"
  "validatable"
  "text!templates/tasks/new_task.html"
], ($, _, Backbone, Validatable, newTaskTemplate) ->

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
			@model.set importance: @$("#importance").val()
			@model.save()

	});

	_.extend newTaskView.prototype, Validatable
	return newTaskView
