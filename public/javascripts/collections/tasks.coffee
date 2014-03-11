define [
  "jquery"
  "underscore"
  "backbone"
  "models/task"
], ($, _, Backbone, Task) ->

	tasks = Backbone.Collection.extend({

		model: Task
		url: "/tasks"

		
	});

	return tasks
