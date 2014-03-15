define [
  "jquery"
  "underscore"
  "backbone"
  "models/task"
], ($, _, Backbone, Task) ->

	tasks = Backbone.Collection.extend({

		model: Task
		url: "/tasks"

		comparator: (option) ->
			return [option.get('sortable_place'), option.get("importance"), option.get("created_at")]
		
	});

	return tasks
