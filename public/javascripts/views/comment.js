// Generated by CoffeeScript 1.7.1
(function() {
  define(["jquery", "underscore", "backbone", "text!templates/partials/comment.hbs", "handlebars"], function($, _, Backbone, commentTemplate, Handlebars) {
    var comment;
    comment = Backbone.View.extend({
      tagName: 'li',
      template: Handlebars.compile(commentTemplate),
      initialize: function() {
        return this.render();
      },
      render: function() {
        this.$el.html(this.template({
          comment: this.options.comment
        }));
        return this;
      }
    });
    return comment;
  });

}).call(this);
