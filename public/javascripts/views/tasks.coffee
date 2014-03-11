define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/task"
  "text!templates/tasks/tasks.html"
  "text!templates/partials/filter_dropdown.html"
], ($, _, Backbone, Vent, TaskView, tasksTemplate, filterTemplate) ->

	tasks = Backbone.View.extend({

		initialize: ->
			@childViews = []
			@listenTo @collection, "reset", @render
			@listenTo Vent, "task:create", @renderNewTask
			@listenTo Vent, "collection:add", @render
			@collection.fetch({ reset: true })
		

		render: ->
			
			@$el.html(_.template( tasksTemplate ))
			@$el.find("#filterablearea").append(@createImportanceSelect()); 
			
			@collection.forEach @renderTask, @
			Vent.trigger('app.event')
			@

		renderNewTask: (model) ->
			@collection.fetch({ reset: true })
			Vent.trigger "collection:add"

		renderTask: (model) ->
			view = new TaskView({ model: model, collection: @collection })
			@childViews.push(view)
			@$('#taskList').append(view.render().el)

		getImportances: ->

		createImportanceSelect: -> 
			$(filterTemplate)

	});

	return tasks