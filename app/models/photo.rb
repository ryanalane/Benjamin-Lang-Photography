class Photo < ActiveRecord::Base
	belongs_to :project
	
	has_attached_file :image, :styles => { :medium => "500", :thumb => "152" }
	
end
