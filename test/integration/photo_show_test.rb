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
    
end
