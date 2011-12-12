class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_type_id
      t.string :name
      t.integer :display_order

      t.timestamps
    end
  end
end
