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

		importance: (val) ->
			return this.filter (n) ->
				return n.get('importance') == val; 
		
	});

	return tasks
