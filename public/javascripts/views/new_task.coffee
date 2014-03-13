define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "validatable"
  "text!templates/tasks/new_task.hbs"
  "handlebars"
], ($, _, Backbone, Vent, Validatable, newTaskTemplate, Handlebars) ->

	newTaskView = Backbone.View.extend({
		initialize: ->
			@listenTo @model, 'invalid', @renderErrors
			@listenTo @model, "error", @parseErrorResponse # for the validation serverside
			@listenTo @model, 'sync', @render
			@model.fetch() unless @model.isNew()

		template: Handlebars.compile(newTaskTemplate)

		events: 
			'submit': 'saveProject'

		render: ->
			@$el.html(@template(@model.toJSON()))
			@

		saveProject: (e) ->
			e.preventDefault()
			@model.set name: @$("#name").val()
			console.log @model.get('id')
			console.log '123213'

			if typeof @model.get('id') is 'undefined'				

				if @$("#comment").val() == ''
					@model.set comments: []
				else
					@model.set comments: [{comment: @$("#comment").val(), by: 'John Doe', created_at: new Date() }]

			@model.set importance: @$("#importance").val()
			@model.save null,
				success: (model, data) =>
					Vent.trigger "task:create", model
					@clearForm()


		clearForm: ->
			@clearErrors()
			delete @model.id
			@model.reset({})

	});

	_.extend newTaskView.prototype, Validatable
	return newTaskView
