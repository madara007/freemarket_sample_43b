class CreateShipMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_methods do |t|
      t.integer :type, null: false
      t.timestamps
    end
  end
end
