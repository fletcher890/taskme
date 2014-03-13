define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/new_task"
  "models/task"
  "text!templates/content/content.haml"
  "handlebars"
], ($, _, Backbone, Vent, NewTaskView, TaskModel, contentTemplate, Handlebars) ->

	contentView = Backbone.View.extend({

		template: Handlebars.compile(contentTemplate)

		events: {
			'click #clearEditForm': 'newTask'
		}

		initialize: ->
			@listenTo Vent, "task:edit", @editTask

		swapMain: (view) ->
			@changeCurrentMainView(view)
			@$('#main-area').html(@currentMainView.render().el)

		changeCurrentMainView: (view) ->
			@currentMainView.remove() if @currentMainView
			@currentMainView = view

		swapSide: (view) ->
			@changeCurrentSideView(view)
			@$('#sidebar').html(@currentSideView.render().el)

		changeCurrentSideView: (view) ->
			@currentSideView.remove() if @currentSideView
			@currentSideView = view

		render: ->
			@$el.html(@template({title: 'content area'}))
			@

		editTask: (model) ->
			@swapSide(new NewTaskView({ model: model }))

		newTask: ->
			@swapSide(new NewTaskView(model: new TaskModel()))


	});

	return contentView