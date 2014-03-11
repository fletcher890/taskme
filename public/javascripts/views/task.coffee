define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "views/comment"
  "collections/tasks"
  "text!templates/tasks/task.html"
  "handlebars"
], ($, _, Backbone, Vent, CommentView, taskCollection, taskTemplate, Handlebars) ->

	task = Backbone.View.extend({

		initialize: ->

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
			comment = {comment: $(e.currentTarget).parent().find('.commentTextarea').val(), by: 'John Doe', created_at: new Date() }
			comments.push(comment);
			@model.set comments: comments 
			@model.save {wait: true},
				success: (model) =>
					$(e.currentTarget).parent().find('.commentTextarea').val('')
					comm = new CommentView({ comment: comment })
					@$el.find('.commentWrapper .comment').append(comm.render().el)
					@$el.find('span.badge').text(@model.get('comments').length)
	});

	return task