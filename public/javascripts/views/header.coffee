define [
  "jquery"
  "underscore"
  "backbone"
  "collections/tasks"
  "vent"
  "text!templates/header/header.hbs"
  "handlebars"
], ($, _, Backbone, TasksCollection, Vent, headerTemplate, Handlebars) ->

	headerView = Backbone.View.extend({
		
		template: Handlebars.compile(headerTemplate)

		initialize: ->
			@coll = new TasksCollection();
			@coll.fetch({success: =>
				@render()
			})
			@listenTo Vent, 'task:create', @importanceCount
			@listenTo Vent, 'task:archive', @importanceCount
			@listenTo Vent, 'task:destroy', @importanceCount

		render: ->
			@$el.html(@template({title: "Workr", high: @coll.importance('1').length, medium: @coll.importance('2').length, low: @coll.importance('3').length}))
			@

		importanceCount: ->
			@coll.fetch({success: =>
				@render()
			})
			


	});

	return headerView