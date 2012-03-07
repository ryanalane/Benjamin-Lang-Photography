$ ->
	window.show = (element) ->
		element.removeClass 'hidden'
		
	window.hide = (element) ->
		element.addClass 'hidden'