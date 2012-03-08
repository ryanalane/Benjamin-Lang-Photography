$ ->
	new_proj_type_input = $('#new_proj_type_input')
	new_proj_type_li = $('#new_proj_type_li')
	
	$('#add_project_type_a').click ->
		window.show new_proj_type_li
		new_proj_type_input.focus()
		
	add_project_type = (project_type_name) ->
		
		next_project_type = $('#stock_empty_project_type_li').clone(true)
		
		next_project_type.removeAttr 'id'
		
		# Removes blocking 'invisible' class from necessary elements
		next_project_type.removeClass 'invisible'
		
		# Fill in the name of the new project_type
		next_project_type.find('.nav_a').html(project_type_name)
	
		old_last_project_type = $('#new_proj_type_li').prev()
		
		
		$(old_last_project_type).after(next_project_type)
	
	
	# Add Project when 'enter' is pressed after typing a new project name
	$(new_proj_type_input).keypress (e) ->
		if e.which is 13
		
			window.hide new_proj_type_li
			
			add_project_type $(this).val()
			$(this).val '' # Clears the input field
			
			return false # This prevents the form from submitting