define ["jquery", "underscore", "backbone", 'public/javascripts/backbone/models/todo'], ($, _, Backbone, Todo) ->

	Todos = Backbone.Collection.extend({
		model: Todo,
		url: '/todos',
		comparator: (todo) ->
			return todo.get('priority')

		parse: (res) ->
			res.response.todos
	});