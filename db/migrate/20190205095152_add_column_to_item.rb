class AddColumnToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :name, :string, null: true
    change_column :items, :price, :integer, null: true
    change_column :items, :description, :text, null: true
    change_column :items, :created_at, :datetime, null: true
    change_column :items, :updated_at, :datetime, null: true
  end

  def down
    change_column :items, :name, :string, null: false
    change_column :items, :price, :integer, null: false
    change_column :items, :description, :text, null: false
    change_column :items, :created_at, :datetime, null: false
    change_column :items, :updated_at, :datetime, null: false
  end
end
