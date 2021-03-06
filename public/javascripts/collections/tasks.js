// Generated by CoffeeScript 1.7.1
(function() {
  define(["jquery", "underscore", "backbone", "models/task"], function($, _, Backbone, Task) {
    var tasks;
    tasks = Backbone.Collection.extend({
      model: Task,
      url: "/tasks",
      comparator: function(option) {
        return [option.get('sortable_place'), option.get("importance"), option.get("created_at")];
      },
      importance: function(val) {
        return this.filter(function(n) {
          return n.get('importance') === val;
        });
      }
    });
    return tasks;
  });

}).call(this);
