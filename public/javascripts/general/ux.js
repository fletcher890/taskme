// Generated by CoffeeScript 1.7.1
(function() {
  $(document).ready(function() {
    var toggleComments;
    $("body").on("click", '.list-group .glyphicon.controls', function() {
      return toggleComments($(this));
    });
    return toggleComments = function(obj) {
      if (obj.hasClass("glyphicon-plus")) {
        $('.list-group-item .commentWrapper').slideUp();
        $('.list-group-item').css('cursor', 'move');
        $('.list-group-item .commentWrapper').slideUp();
        $('.list-group-item .commentWrapper').parent().find('.glyphicon-minus').removeClass('glyphicon-minus').addClass('glyphicon-plus');
        obj.removeClass("glyphicon-plus");
        obj.addClass("glyphicon-minus");
        obj.parent().find('.commentWrapper').slideDown();
        return obj.parent().css('cursor', 'default');
      } else {
        obj.removeClass("glyphicon-minus");
        obj.addClass("glyphicon-plus");
        obj.parent().find('.commentWrapper').slideUp();
        return obj.parent().css('cursor', 'move');
      }
    };
  });

}).call(this);
