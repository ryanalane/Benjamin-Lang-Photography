$ ->
	add_new_project_field = ->
		new_proj_li = $('#new_proj_li')
		new_proj_li.removeClass 'hidden'
	
	place_cursor_in_new_project_field = ->
		new_proj_input.focus()
	
	$('#new_project_link_a').click ->
		add_new_project_field()
		place_cursor_in_new_project_field()
	
	