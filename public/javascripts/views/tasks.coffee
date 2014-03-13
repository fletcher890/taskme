define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/task"
  "text!templates/tasks/tasks.hbs"
  "text!templates/partials/filter_dropdown.hbs"
  "handlebars"
], ($, _, Backbone, Vent, TaskView, tasksTemplate, filterTemplate, Handlebars) ->

	tasks = Backbone.View.extend({

		template: Handlebars.compile(tasksTemplate)
		events: {
			"click #filterablearea a": "setFilter",
		}

		initialize: ->
			@childViews = []
			@listenTo @collection, "reset", @render
			@listenTo @collection, "reset", @render
			@listenTo Vent, "task:create", @renderNewTask
			@listenTo Vent, "collection:add", @render
			@on "change:filterValue", @filterByImportance, @
			@collection.fetch({ reset: true }) 
		

		render: ->
			
			@$el.html(@template({collection: @collection}))
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

		setFilter: (e) ->
			e.preventDefault()
			@filterValue = $(e.currentTarget).attr "data-ref"
			@trigger "change:filterValue"

		filterByImportance: ->
			if @filterValue is 'tasks-live'

				@collection.fetch({
					success: (collection) => 
						console.log "in here"
						@render()
				})

			else if @filterValue is 'tasks-archive'

				@collection.fetch( { 
					url: '/tasks/archive'
					success: (collection) => 
						@render()
				})

			else
				console.log "in herer"

		createImportanceSelect: -> 
			$(filterTemplate)

	});

	return tasks