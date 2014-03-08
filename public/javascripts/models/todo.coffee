define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
	
	Todo = Backbone.Model.extend({
		
		defaults: {
			'priority': 3
		},

		validate: (attrs) ->
			if (!attrs.title) 
				return 'cannot have an empty title'

	});