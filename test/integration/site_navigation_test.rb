require 'integration_test_helper'

class SiteNavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "should load root_path when user clicks logo" do
  	visit root_path
  	click_link 'logo'
  	assert_equal current_path, root_path
  end
  
end
