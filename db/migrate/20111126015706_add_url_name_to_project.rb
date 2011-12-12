class AddUrlNameToProject < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
  		t.string :url_name
  	end
  end
end
