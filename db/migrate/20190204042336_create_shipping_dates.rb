class CreateShippingDates < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_dates do |t|
      t.integer :day ,null: false
      t.timestamps
    end
  end
end
