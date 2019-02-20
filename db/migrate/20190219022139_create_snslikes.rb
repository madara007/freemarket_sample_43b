class CreateSnslikes < ActiveRecord::Migration[5.2]
  def change
    create_table :snslikes do |t|
      t.references :snscredential, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
