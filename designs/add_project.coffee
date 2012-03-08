$ ->
	new_proj_input = $('#new_proj_input')
	new_proj_li = $('#new_proj_li')
	
	$('#add_project_a').click ->
		window.show new_proj_li
		new_proj_input.focus()
		
	add_project = (project_name) ->
		
		next_project = $('#stock_empty_project_li').clone(true)
		
		next_project.removeAttr 'id'
		
		# Removes blocking 'invisible' class from necessary elements
		next_project.removeClass 'invisible'
		next_project.find('img').removeClass 'invisible'
		
		
		next_project.find('.nav_a').html(project_name)
	
		old_last_project = $('#new_proj_li').prev()
		
		
		$(old_last_project).after(next_project)
	
	
	# Add Project when 'enter' is pressed after typing a new project name
	$(new_proj_input).keypress (e) ->
		if e.which is 13
		
			window.hide new_proj_li
			
			add_project $(this).val()
			$(this).val '' # Clears the input field
			
			return false # This prevents the form from submitting