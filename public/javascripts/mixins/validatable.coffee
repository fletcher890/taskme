define [
  "jquery"
  "backbone"
  "underscore"
], ($, Backbone, _) ->
	validatable =
		renderErrors: (model, errors) ->
			@clearErrors()
			_.each errors, @renderError, @

		renderError: (errors, attribute) ->
			err = errors.join "; "
			@$("#" + attribute).closest("div.form-group").addClass('has-error')
			@$("#" + attribute).closest("div.form-group").append('<span class="help-block">' + err + '</span>')

		parseErrorResponse: (model, response) ->
			if response and response.status is 403
				App.Vent.trigger "access_denied"
			if response and response.responseText
				errors = JSON.parse response.responseText
				@renderErrors(model, errors.errors)

		clearErrors: ->
			@$('.has-error').removeClass('has-error')
			@$('span.help-block').remove()

	return validatable