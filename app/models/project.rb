class Project < ActiveRecord::Base
	belongs_to :project_type
	has_many :photos
end
