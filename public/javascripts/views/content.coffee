define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/new_task"
  "text!templates/content/content.html"
], ($, _, Backbone, Vent, NewTaskView, contentTemplate) ->

	contentView = Backbone.View.extend({

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
			compiledTemplate = _.template( contentTemplate, {title: 'content area'} )
			@$el.html(compiledTemplate)
			@

		editTask: (model) ->
			@swapSide(new NewTaskView({ model: model }))
			console.log model
			console.log "in here"


	});

	return contentView