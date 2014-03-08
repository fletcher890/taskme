define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/content/content.html"
], ($, _, Backbone, contentTemplate) ->

	contentView = Backbone.View.extend({

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
			@currentSideView.leave() if @currentSideView
			@currentSideView = view

		render: ->
			compiledTemplate = _.template( contentTemplate, {title: 'content area'} )
			@$el.html(compiledTemplate)
			@

	});

	return contentView