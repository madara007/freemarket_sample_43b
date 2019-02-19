class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :type, null: false
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
