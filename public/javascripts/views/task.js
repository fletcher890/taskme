// Generated by CoffeeScript 1.7.1
(function() {
  define(["jquery", "underscore", "backbone", "vent", "views/comment", "collections/tasks", "text!templates/tasks/task.html", "handlebars"], function($, _, Backbone, Vent, CommentView, taskCollection, taskTemplate, Handlebars) {
    var task;
    task = Backbone.View.extend({
      initialize: function() {},
      tagName: 'li',
      className: 'list-group-item',
      events: {
        'click .btn.commentAdd': 'addComment',
        'click .btn.editTask': 'editTask',
        'click .btn.archiveTask': 'archiveTask'
      },
      template: Handlebars.compile(taskTemplate),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      },
      addComment: function(e) {
        var comment, comments;
        e.preventDefault();
        comments = this.model.get('comments');
        comment = {
          comment: $(e.currentTarget).parent().find('.commentTextarea').val(),
          by: 'John Doe',
          created_at: new Date()
        };
        comments.push(comment);
        this.model.set({
          comments: comments
        });
        return this.model.save({
          wait: true
        }, {
          success: (function(_this) {
            return function(model) {
              var comm;
              $(e.currentTarget).parent().find('.commentTextarea').val('');
              comm = new CommentView({
                comment: comment
              });
              _this.$el.find('.commentWrapper .comment').append(comm.render().el);
              return _this.$el.find('span.badge').text(_this.model.get('comments').length);
            };
          })(this)
        });
      },
      archiveTask: function() {
        console.log("archive task");
        this.$el.find('.commentWrapper').slideUp();
        return this.$el.find('.commentWrapper').parent().fadeOut();
      },
      editTask: function() {
        return Vent.trigger("task:edit", this.model);
      }
    });
    return task;
  });

}).call(this);
