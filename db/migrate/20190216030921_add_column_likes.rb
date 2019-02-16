class AddColumnLikes < ActiveRecord::Migration[5.2]
  def change
  	add_column :likes, :snscredential_id, :integer
  end
end
