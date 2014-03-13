$(document).ready ->
	
	$("body").on "click", '.list-group .glyphicon.controls', ->

		toggleComments($(@))


	toggleComments = (obj) -> 
		if obj.hasClass "glyphicon-plus"
			$('.list-group-item .commentWrapper').slideUp()
			$('.list-group-item .commentWrapper').parent().find('.glyphicon-minus').removeClass('glyphicon-minus').addClass('glyphicon-plus')
			obj.removeClass "glyphicon-plus"
			obj.addClass "glyphicon-minus"
			obj.parent().find('.commentWrapper').slideDown()

		else
			obj.removeClass "glyphicon-minus"
			obj.addClass "glyphicon-plus"
			obj.parent().find('.commentWrapper').slideUp()