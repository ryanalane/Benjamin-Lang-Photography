require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  
=begin
   test "new ProjectType should not be created if :name is nil" do
   	new_display_order = ProjectType.find(:all, :order => 'display_order DESC').first.display_order + 1
   	new_proj_type = ProjectType.create(:name => nil, :display_order => new_display_order)
   	assert !new_proj_type.errors[:name].empty?
   end

	test "new ProjectType should not be created if :display_order is nil" do
		new_proj_type = ProjectType.create(:name => 'new name', :display_order => nil)
		assert !new_proj_type.errors[:display_order].empty?
	end
=end	

end
