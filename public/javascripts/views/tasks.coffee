define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/task"
  "text!templates/tasks/tasks.haml"
  "text!templates/partials/filter_dropdown.haml"
  "handlebars"
], ($, _, Backbone, Vent, TaskView, tasksTemplate, filterTemplate, Handlebars) ->

	tasks = Backbone.View.extend({

		template: Handlebars.compile(tasksTemplate)

		initialize: ->
			@childViews = []
			@listenTo @collection, "reset", @render
			@listenTo Vent, "task:create", @renderNewTask
			@listenTo Vent, "collection:add", @render
			@collection.fetch({ reset: true })
		

		render: ->
			
			@$el.html(@template())
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