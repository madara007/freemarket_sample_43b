class CreateDeliveryFees < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fees do |t|
      t.integer :type, null: false
      t.timestamps
    end
  end
end