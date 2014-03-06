$(document).ready ->
	
	$(".list-group .glyphicon#controls").on "click", ->

		toggleComments($(@))


	toggleComments = (obj) -> 
		if obj.hasClass "glyphicon-plus"
			obj.removeClass "glyphicon-plus"
			obj.addClass "glyphicon-minus"
			obj.parent().find('.commentWrapper').slideDown()

		else
			obj.removeClass "glyphicon-minus"
			obj.addClass "glyphicon-plus"
			obj.parent().find('.commentWrapper').slideUp()