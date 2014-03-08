define [
  "jquery"
  "underscore"
  "backbone"
  "text!templates/header/header.html"
], ($, _, Backbone, headerTemplate) ->

	headerView = Backbone.View.extend({
		
		render: ->
			compiledTemplate = _.template( headerTemplate, { title: 'Taskme' } );
			@$el.html(compiledTemplate)
			@

	});

	return headerView