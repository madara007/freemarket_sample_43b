class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.integer :buyer_id
      t.integer :saler_id
      t.references :shipping_date, foreign_key: true
      t.references :condition, foreign_key: true
      t.references :region, foreign_key: true
      t.references :delivery_fee, foreign_key: true
      t.references :ship_method, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.integer :transaction, default: 1,null: false
      t.timestamps
    end
  end
end
