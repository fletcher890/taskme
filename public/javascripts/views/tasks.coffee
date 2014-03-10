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
			@collection.fetch({ reset: true })
			

		render: ->
			compiledTemplate = _.template( tasksTemplate )
			@$el.html(compiledTemplate)
			@collection.forEach @renderProject, @
			Vent.trigger('app.event')
			@

		renderProject: (model) ->
			view = new TaskView({ model: model })
			@childViews.push(view)
			@$('#taskList').append(view.render().el)

	});

	return tasks