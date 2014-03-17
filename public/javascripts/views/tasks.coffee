define [
  "jquery"
  "jqueryui"
  "jqueryuipunch"
  "underscore"
  "backbone"
  "vent"
  "views/task"
  "collections/tasks"
  "text!templates/tasks/tasks.hbs"
  "text!templates/partials/filter_dropdown.hbs"
  "handlebars"
], ($, $ui, $punch, _, Backbone, Vent, TaskView, TasksCollection, tasksTemplate, filterTemplate, Handlebars) ->

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
			@listenTo Vent, "drop:sort", @updateSortOrder
			@on "change:filterValue", @filterByImportance, @
			@collection.fetch({ reset: true }) 
			@filterValue = undefined
		

		render: ->
			
			@$el.html(@template({collection: @collection}))
			@$el.find("#filterablearea").append(@createImportanceSelect()); 
			@collection.forEach @renderTask, @
			Vent.trigger('app.event')
			$("#taskList").sortable stop: (event, ui) ->
				ui.item.trigger "drop", ui.item.index()
				return
			@

		renderNewTask: (model) ->
			if typeof @filterValue is 'undefined'
				@collection.fetch({ reset: true })
				Vent.trigger "collection:add"
			else
				@filterByImportance()


		renderTask: (model) ->
			view = new TaskView({ model: model, collection: @collection })
			@childViews.push(view)
			@$('#taskList').append(view.render().el)

		setFilter: (e) ->
			e.preventDefault()
			@filterValue = $(e.currentTarget).attr "data-ref"
			@trigger "change:filterValue"

		updateSortOrder: (event, model, position) ->
			
			@collection.remove model
			@collection.each (model, index) ->
				ordinal = index
				ordinal += 1  if index >= position
				model.set "sortable_place", ordinal
				model.save()
				return

			model.set "sortable_place", position
			model.save()
			@collection.add model, at: position


		filterByImportance: ->
			if @filterValue is 'tasks-live'

				@collection.fetch({
					success: (collection) => 
						@render()
				})

				@filterValue = undefined

			else if @filterValue is 'tasks-archive'

				c = new TasksCollection({ url: '/tasks/archive'});
				c.url = '/tasks/archive'
				c.fetch({ success: =>
					@collection.reset c.models
					@render()
				});


			else

				@collection.fetch({ success: =>

					filterValue = @filterValue
					
					if filterValue is 'importance-high'
						val = '1'
					else if filterValue is 'importance-medium'
						val = '2'
					else 
						val = '3'

					filtered = _.filter(@collection.models, (item) ->
						item.get("importance").toLowerCase() is val
					)
					@collection.reset filtered
					@render()

				})

		createImportanceSelect: -> 
			$(filterTemplate)

	});

	return tasks