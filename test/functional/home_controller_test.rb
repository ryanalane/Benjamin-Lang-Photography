require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "root_path should route to home#index" do
  	assert_recognizes({:controller => 'home', :action => 'index'}, root_path)
  end

end
