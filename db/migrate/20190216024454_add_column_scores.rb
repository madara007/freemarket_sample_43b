class AddColumnScores < ActiveRecord::Migration[5.2]
  def change
  	add_column :scores, :snscredential_id, :integer
  end
end
