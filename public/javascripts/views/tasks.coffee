define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/task"
  "text!templates/tasks/tasks.html"
], ($, _, Backbone, Vent, TaskView, tasksTemplate) ->

	tasks = Backbone.View.extend({

		initialize: ->
			@childViews = []
			@listenTo @collection, "reset", @render
			@listenTo @collection, "add", @render
			@listenTo Vent, "task:create", @renderNewTask
			@collection.fetch({ reset: true })
			

		render: ->
			console.log " in here"
			compiledTemplate = _.template( tasksTemplate )
			@$el.html(compiledTemplate)
			@collection.forEach @renderTask, @
			Vent.trigger('app.event')
			@

		renderNewTask: (model) ->
			console.log 	
			@collection.add model

		renderTask: (model) ->
			view = new TaskView({ model: model })
			@childViews.push(view)
			@$('#taskList').append(view.render().el)

	});

	return tasks