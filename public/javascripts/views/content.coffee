define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/new_task"
  "text!templates/content/content.html"
  "handlebars"
], ($, _, Backbone, Vent, NewTaskView, contentTemplate, Handlebars) ->

	contentView = Backbone.View.extend({

		template: Handlebars.compile(contentTemplate)

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
			console.log model
			console.log "in here"


	});

	return contentView