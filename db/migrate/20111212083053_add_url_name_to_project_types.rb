class AddUrlNameToProjectTypes < ActiveRecord::Migration
  def change
  	change_table :project_types do |t|
  		t.string :url_name
  	end
  end
end
