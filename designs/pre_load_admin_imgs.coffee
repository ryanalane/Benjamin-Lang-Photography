$ ->
	window.img_path_prefix = '../layout_images/'
	window.full_circle_filename = 'full_circle_c1.png'
	window.empty_circle_filename = 'empty_circle_c1.png'
	$([img_path_prefix+full_circle_filename,img_path_prefix+empty_circle_filename]).preload()