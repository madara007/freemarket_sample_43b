class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.integer :type,default: 0, null: false
      t.integer :group
      t.timestamps
    end
  end
end
