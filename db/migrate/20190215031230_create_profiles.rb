class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text   :avatar
      t.text   :comment
      t.string :tel, unique: true
      t.string :postal_code
      t.string :prefecture
      t.string :city
      t.string :number
      t.string :building
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
