$ ->
	new_proj_input = $('#new_proj_input')
	new_proj_li = $('#new_proj_li')
	
	place_cursor_in_new_project_field = ->
		new_proj_input.focus()
	
	$('#add_project_a').click ->
		window.show new_proj_li 
		place_cursor_in_new_project_field()
		
	add_project = (project_name) ->
		
		new_project_li = $('#stock_empty_project_li').clone(true)
		
		new_project_li.removeAttr 'id'
		
		# Removes blocking 'invisible' class from necessary elements
		new_project_li.removeClass 'invisible'
		new_project_li.find('img').removeClass 'invisible'
		
		
		new_project_li.find('.nav_a').html(project_name)
	
		old_last_li = $('#new_proj_li').prev()
		
		
		$(old_last_li).after(new_project_li)
	
	
	# Add Project when 'enter' is pressed after typing a new project name
	$(new_proj_input).keypress (e) ->
		if e.which is 13
		
			window.hide new_proj_li
			new_proj_li.blur() # Hides a lingering cursor, seen on some browsers
			
			add_project $(this).val()
			$(this).val '' # Clears the input field
			
			return false # This prevents the form from submitting