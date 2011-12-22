require 'integration_test_helper'

class SiteNavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "should load root_path when user clicks logo" do
  	visit root_path
  	click_link 'logo'
  	assert_equal root_path, current_path
  end
  
  test "should load /project_type_url_name/ when user clicks ProjectType links underneath the logo" do
  	visit root_path
  	ProjectType.find(:all, :order=>'display_order').each do |proj_type|
  		click_link proj_type.name
  		assert_equal '/' + proj_type.url_name, current_path
  	end
  end
  
  test "should navigate to /project_type_url_name/project_url_name/1 page when user clicks Project links in the side-nav from the /project_type_url_name/ pages" do
  	visit root_path
  	ProjectType.find(:all, :order=>'display_order').each do |proj_type|
  	
  		proj_type.projects.each do |project|
  			click_link proj_type.name
				click_link project.name
				assert_equal '/' + proj_type.url_name + '/' + project.url_name + '/1', current_path # The '/1' represents a redirect to the first photo of the project
  		end
  		
  	end
  end

	test "should navigate to /project_type_url_name/project_url_name/ page when user clicks Project links in the side-nav from the /project_type_url_name/project_url_name/ pages" do
  	visit root_path
  	ProjectType.find(:all, :order=>'display_order').each do |proj_type|
  	
  		proj_type.projects.each do |project|
  			click_link proj_type.name
				click_link project.name
				click_link project.name # Duplicate click validates the functionality of the side-nav
				assert_equal '/' + proj_type.url_name + '/' + project.url_name + '/1', current_path
  		end
  		
  	end
  end
  
end
