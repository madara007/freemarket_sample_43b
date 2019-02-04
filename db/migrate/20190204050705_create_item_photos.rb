class CreateItemPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_photos do |t|
      t.text :photo, null:false
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
