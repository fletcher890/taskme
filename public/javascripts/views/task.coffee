define [
  "jquery"
  "underscore"
  "backbone"
  "vent"
  "text!templates/tasks/task.hbs"
  "handlebars"
], ($, _, Backbone, Vent, taskTemplate, Handlebars) ->

	task = Backbone.View.extend({

		initialize: ->

		tagName: 'li'
		className: 'list-group-item'

		events: {
			'click .btn.commentAdd': 'addComment',
			'click .btn.editTask': 'editTask'
			'click .btn.archiveTask': 'archiveTask'
			'click .btn.removeTask': 'removeTask'
			'click .btn.reinstateTask': 'reinstateTask'
			'drop': 'drop'
		}

		template: Handlebars.compile(taskTemplate)


		render: ->
			@$el.html(@template(@model.toJSON()))
			@

		addComment: (e) ->
			require ["views/comment"], (CommentView) ->
				e.preventDefault()
				comments = @model.get('comments');
				comment = {comment: $(e.currentTarget).parent().find('.commentTextarea').val(), by: 'John Doe', created_at: new Date() }
				comments.push(comment);
				@model.set comments: comments 
				@model.save {wait: true},
					success: (model) =>
						$(e.currentTarget).parent().find('.commentTextarea').val('')
						comm = new CommentView({ comment: comment })
						@$el.find('.commentWrapper .comment .comments').append(comm.render().el)
						@$el.find('span.badge').text(@model.get('comments').length)

		archiveTask: (e, value = true) ->
			e.preventDefault()
			@model.set archive: value
			@model.save {wait: true},
				success: (model) =>
					Vent.trigger "task:archive", @model
					@closeUpOption()

		reinstateTask: (e) ->
			@archiveTask e, false

		removeTask: (e) ->
			e.preventDefault()
			return unless confirm("Are you sure?")
			@model.destroy { wait: true }
			Vent.trigger "task:destroy", @model
			@closeUpOption()


		editTask: ->
			Vent.trigger "task:edit", @model


		drop: (event, index) ->
			Vent.trigger "drop:sort", event, @model, index

		closeUpOption: ->

			@$el.find('.commentWrapper').slideUp()
			@$el.find('.commentWrapper').parent().fadeOut()

	});

	return task