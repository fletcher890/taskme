define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "text!templates/tasks/task.html"
  "handlebars"
], ($, _, Backbone, Vent, taskTemplate) ->

	task = Backbone.View.extend({

		tagName: 'li'
		className: 'list-group-item'

		events: {
			'click .btn.commentAdd': 'addComment'
		}

		template: Handlebars.compile(taskTemplate)


		render: ->
			@$el.html(@template(@model.toJSON()))
			@

		addComment: (e) ->
			e.preventDefault()
			comments = @model.get('comments');
			comments.push({comment: $(e.currentTarget).parent().find('.commentTextarea').val(), by: 'John Doe', created_at: new Date() });
			@model.set comments: comments 
			@model.save {wait: true},
				success: ->
					$(e.currentTarget).parent().find('.commentTextarea').val('')

	});

	return task