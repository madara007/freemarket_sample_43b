class Score < ApplicationRecord
  belongs_to :user
  self.inheritance_column = :_type_disabled
  validates :type, presence: { message: "評価を選択してください。" }
end
