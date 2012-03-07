$ ->
	
	show_proj_display = (li) ->
		proj_display = $(li).find 'img.proj_display'
		proj_display.removeClass 'hidden'
	
	hide_proj_display = (li) ->
		proj_display = $(li).find 'img.proj_display'
		proj_display.addClass 'hidden'
		
	toggle_proj_display = (proj_display)->
		li = $(proj_display).parents 'li'
		a = li.children 'a.nav_a'
		img = $(proj_display).children 'img.proj_display'
		if a.hasClass 'hidden_project'
			a.removeClass 'hidden_project'
			$(img).attr 'src', img_path_prefix+full_circle_filename
		else
			a.addClass 'hidden_project'
			$(img).attr 'src', img_path_prefix+empty_circle_filename

	side_nav_lis = $('#side_nav_list > li:not("#new_proj_li")')
	
	side_nav_lis.mouseover ->
		show_proj_display(this)
	
	side_nav_lis.mouseout ->
		hide_proj_display(this)
		
	side_nav_lis.each ->
		proj_display_a = $(this).find 'a.proj_display_a'
		proj_display_a.click ->
			toggle_proj_display(this)