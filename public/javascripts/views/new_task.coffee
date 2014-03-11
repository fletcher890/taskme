define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "validatable"
  "text!templates/tasks/new_task.html"
], ($, _, Backbone, Vent, Validatable, newTaskTemplate) ->

	newTaskView = Backbone.View.extend({
		initialize: ->
			@listenTo @model, 'invalid', @renderErrors
			@listenTo @model, "error", @parseErrorResponse # for the validation serverside
			@listenTo @model, 'sync', @render
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
			if @$("#comment").val() == ''
				@model.set comments: []
			else
				@model.set comments: [{comment: @$("#comment").val(), by: 'John Doe', created_at: new Date() }]

			@model.set importance: @$("#importance").val()
			@model.save {wait: true},
				success: (model, data) =>
					Vent.trigger "task:create", model
					@clearForm()

		clearForm: ->
			@clearErrors()
			delete @model.id

	});

	_.extend newTaskView.prototype, Validatable
	return newTaskView
