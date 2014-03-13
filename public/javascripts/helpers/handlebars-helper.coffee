define [
  "jquery"
  "underscore"
  "backbone"
  "handlebars"
], ($, _, Backbone, Handlebars) ->

	$.fn.htmlInclusive = ->
		$('<div />').append($(this).clone()).html(); 

	DateFormats = {
       short: "DD MMMM - YYYY",
       long: "dddd DD.MM.YYYY HH:mm"
	}


	  
	Handlebars.registerHelper "ifCond", (v1, operator, v2, options) ->
	  switch operator
	    when "=="
	      (if (v1 is v2) then options.fn(this) else options.inverse(this))
	    when "==="
	      (if (v1 is v2) then options.fn(this) else options.inverse(this))
	    when "<"
	      (if (v1 < v2) then options.fn(this) else options.inverse(this))
	    when "<="
	      (if (v1 <= v2) then options.fn(this) else options.inverse(this))
	    when ">"
	      (if (v1 > v2) then options.fn(this) else options.inverse(this))
	    when ">="
	      (if (v1 >= v2) then options.fn(this) else options.inverse(this))
	    when "&&"
	      (if (v1 and v2) then options.fn(this) else options.inverse(this))
	    when "||"
	      (if (v1 or v2) then options.fn(this) else options.inverse(this))
	    else
	      options.inverse this

	Handlebars.registerHelper "select", (value = 'importance', options) ->
		$el = $("<select class='form-control' name='" + value + "' id='" + value + "' />").html(options.fn(this))
		$el.find("[value='" + value + "']").attr selected: "selected"
		$el.htmlInclusive()

	Handlebars.registerHelper "prettifyDate", (timestamp) ->
		date = new Date(timestamp)
		curr_year = date.getFullYear()
		curr_month = date.getMonth()
		curr_date  = date.getDate()
		curr_mins  = date.getMinutes()
		curr_hours  = date.getHours()
		date = curr_date + "/" + curr_month  + "/" + curr_year + ' ' + curr_hours + ':' + curr_mins

	Handlebars.registerHelper "importanceClass", (importance) ->
		switch importance
			when '1'
				return 'H'
			when '2'
				return 'A'
			when '3'
				return 'L'

	Handlebars.registerHelper "log", (context) ->
  		return console.log(context);
