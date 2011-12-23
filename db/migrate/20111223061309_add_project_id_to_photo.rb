class AddProjectIdToPhoto < ActiveRecord::Migration
  def change
  	change_table :photos do |t|
  		t.integer :project_id
  	end
  end
end
