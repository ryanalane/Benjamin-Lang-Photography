class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :img_url
      t.string :thumb_url
      t.integer :display_order

      t.timestamps
    end
  end
end
