require 'integration_test_helper'

class PhotoShowTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Photo#show should have a photo in an appropriate div." do
  	proj_type = ProjectType.find(:all).first
  	project = proj_type.projects.first
  	photo = project.photos.find_by_display_order 0
  	visit '/' + proj_type.url_name + '/' + project.url_name
  	
  	# Asserts that the page contains the appropriate HTML tags
  	assert page.has_selector?('div.photo_container img.photo')
  	
  end
  
  test "Image tag should point to the correct image url" do
 		proj_type = ProjectType.find(:all).first
 		project = proj_type.projects.first
  	photo = project.photos.find_by_display_order 1
  	visit '/' + proj_type.url_name + '/' + project.url_name
  
  	# Asserts that the image tag's 'src' attribute points to the correct url
  	assert page.has_selector?('div.photo_container img.photo', :src => photo.img_url)
  end
  
  test "Image tag should have an appropriate alt tag" do
 		proj_type = ProjectType.find(:all).first
  	project = proj_type.projects.first
  	photo = project.photos.find_by_display_order 1
  	visit '/' + proj_type.url_name + '/' + project.url_name
  
  	# Asserts that the image tag's "alt" is of the form: "ProjectName: PhotoNumber"
  	assert page.has_selector?('div.photo_container img.photo', :alt => project.name + ": " + photo.display_order.to_s)
  end
  
  ### Begin previous/next photo integration tests
  
  test "First Photo in a Project should not have a 'prev' link to the previous photo" do
  	project = Project.find_by_url_name("proj-two")
  	assert project.photos.length > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/1'
  	
  	assert page.has_no_selector?('a.prev_next_a', :text => 'prev')
  end
  
  test "First Photo in a Project should have a 'next' link to the next photo IF there is more than one photo in the project" do
  	project = Project.find_by_url_name("proj-two")
  	assert project.photos.length > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/1'
  	
  	assert page.has_selector?('a.prev_next_a', :text => 'next')
  	
  end
  
  test "'Next' link should direct to the next photo in the project" do
  	project = Project.find_by_url_name("proj-two")
  	assert project.photos.length > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/1'
  	
  	click_link 'next'
  	
  	assert_equal '/' + project.project_type.url_name + '/' + project.url_name + '/2', current_path
  	
  end
  
  test "First Photo should not have a 'next' link if there is only one photo in the project" do
  	project = Project.find_by_url_name("proj-four")
  	assert project.photos.length == 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/1'
  	
  	assert page.has_no_selector?('a.prev_next_a', :text => 'next')
  	
  end
  
  test "Non-First Photo in a Project should have a 'prev' link to the previous photon the project" do
  	project = Project.find_by_url_name("proj-two")
  	assert project.photos.length > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/2'
  	
  	assert page.has_selector?('a.prev_next_a', :text => 'prev')
  end
    
  test "'Prev' link should direct to the previous photo in the project" do
  	project = Project.find_by_url_name("proj-two")
  	assert project.photos.length > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/2'
  	
  	click_link 'prev'
  	
  	assert_equal '/' + project.project_type.url_name + '/' + project.url_name + '/1', current_path
  end
  
  test "Last Photo in a Project should not have a 'next' link if there is no more photos in the project" do
  	project = Project.find_by_url_name("proj-two")
  	project_size = project.photos.length
  	assert project_size > 1
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/' + project_size.to_s
  	
  	assert page.has_no_selector?('a.prev_next_a', :text => 'next')
  end
    
  ### End previous/next photo integration tests
  
  ### Begin photo number integration tests
  
  test "First photo number corresponds to the the display_order of the Photo" do
  	photo = Photo.find(:all).first
  	
  	visit '/' + photo.project.project_type.url_name + '/' + photo.project.url_name + '/' + photo.display_order.to_s
  	
  	assert page.has_selector?('span#current_photo_number', :text => photo.display_order.to_s)
  	
  end
  
  test "Second photo number corresponds to the number of photos in the Project" do
  	photo = Photo.find(:all).first
  	project = photo.project
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/' + photo.display_order.to_s
  	
  	assert page.has_selector?('span#total_photo_number', :text => project.photos.length.to_s)
  	
  end
  
  ### End photo number integration tests
  
  ### Begin photo title integration tests
  
  test "Photo displays a title if it has Photo.name is not null" do 
  	project = Project.find_by_url_name("proj-one")
  	photo = project.photos.first
  	assert_not_nil photo.name
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/' + photo.display_order.to_s
  	
  	assert page.has_selector?('p#photo_title', :text => photo.name)
  	
  end
  
  test "Photo does not display a title if Photo.name is null" do
  	project = Project.find_by_url_name("proj-two")
  	photo = project.photos.first
  	assert_nil photo.name
  	
  	visit '/' + project.project_type.url_name + '/' + project.url_name + '/' + photo.display_order.to_s
  	
  	assert page.has_no_selector?('p#photo_title')
  	
  end
  
end
