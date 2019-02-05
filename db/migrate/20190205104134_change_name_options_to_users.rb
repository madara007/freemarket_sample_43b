class ChangeNameOptionsToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :postal_code, :string, null: true
    change_column :users, :prefecture, :string, null: true
    change_column :users, :city, :string, null: true
    change_column :users, :number, :string, null: true
  end

  def down
    change_column :users, :postal_code, :string, null: false
    change_column :users, :prefecture, :string, null: false
    change_column :users, :city, :string, null: false
    change_column :users, :number, :string, null: false
  end
end
