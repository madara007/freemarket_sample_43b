class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.integer :name, null:false
      t.timestamps
    end
  end
end
