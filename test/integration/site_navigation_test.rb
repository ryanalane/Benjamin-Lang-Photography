require 'integration_test_helper'

class SiteNavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "should load root_path when user clicks logo" do
  	visit root_path
  	click_link 'logo'
  end
  
end
